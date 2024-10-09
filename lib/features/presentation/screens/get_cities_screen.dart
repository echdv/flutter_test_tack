// ignore_for_file: library_private_types_in_public_api
/* External dependencies */
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/* Local dependencies */
import 'package:flutter_test_task/features/data/models/city_model.dart';
import 'package:flutter_test_task/features/presentation/logic/city_view_model.dart';
import 'package:flutter_test_task/helpers/components/common_search_field.dart';
import 'package:flutter_test_task/helpers/resources/app_colors.dart';
import 'package:flutter_test_task/helpers/resources/app_fonts.dart';

class GetListCitiesScreen extends ConsumerStatefulWidget {
  final TextEditingController searchController = TextEditingController();

  GetListCitiesScreen({super.key});

  @override
  _CitySearchScreenState createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends ConsumerState<GetListCitiesScreen> {
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    ref.read(cityViewModelProvider.notifier).loadCities();
  }

  @override
  Widget build(BuildContext context) {
    final cityViewModel = ref.watch(cityViewModelProvider);
    ref.listen<AsyncValue<List<GetCityModel>>>(cityViewModelProvider,
        (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: ${next.error}')),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        surfaceTintColor: Colors.transparent,
        title: Text('Города', style: AppFonts.bold20white),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
            child: CommonSearhField(
              searchController: widget.searchController,
              onChanged: _onSearchChanged,
              onSubmitted: (String value) {
                widget.searchController.text = value;
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              color: AppColors.whiteColor,
              backgroundColor: AppColors.blackColor,
              onRefresh: () async {
                await ref.read(cityViewModelProvider.notifier).loadCities();
              },
              child: cityViewModel.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Ошибка: $error')),
                data: (cities) {
                  if (cities.isEmpty) {
                    return const Center(
                        child: Text('Нет городов для отображения.'));
                  }
                  return ListView.builder(
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.whiteColor,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        child: ListTile(
                          title: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 25.h,
                                color: AppColors.black45Color,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                cities[index].name.toString(),
                                style: AppFonts.bold18black,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (query.isNotEmpty) {
        ref.read(cityViewModelProvider.notifier).searchCities(query);
      } else {
        ref.read(cityViewModelProvider.notifier).loadCities();
      }
    });
  }

  @override
  void dispose() {
    widget.searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}

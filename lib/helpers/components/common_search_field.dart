/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:flutter_test_task/helpers/resources/app_colors.dart';
import 'package:flutter_test_task/helpers/resources/app_fonts.dart';

class CommonSearhField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController searchController;

  const CommonSearhField({
    super.key,
    required this.onChanged,
    required this.searchController,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: 'Поиск по названию...',
        hintStyle: AppFonts.normal15black45,
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.blackColor,
        ),
        filled: true,
        fillColor: AppColors.whiteColor,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.blueColor, width: 2.w),
        ),
      ),
    );
  }
}

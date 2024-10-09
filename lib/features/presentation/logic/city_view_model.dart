/* External dependencies */
import 'package:hooks_riverpod/hooks_riverpod.dart';

/* Local dependencies */
import 'package:flutter_test_task/features/domain/use_cases/city_use_case.dart';
import 'package:flutter_test_task/features/providers/city_use_case_provider.dart';
import 'package:flutter_test_task/features/data/models/city_model.dart';

final cityViewModelProvider =
    StateNotifierProvider<CityViewModel, AsyncValue<List<GetCityModel>>>((ref) {
  final fetchCities = ref.watch(fetchCityUseCaseProvider);
  return CityViewModel(fetchCities);
});

class CityViewModel extends StateNotifier<AsyncValue<List<GetCityModel>>> {
  final FetchCityUseCase fetchCities;

  CityViewModel(this.fetchCities) : super(const AsyncValue.loading());

  Future<void> loadCities() async {
    try {
      final cities = await fetchCities.fetchCities();
      state = AsyncValue.data(cities);
    } catch (e) {
      try {
        final cachedCities = await fetchCities.getCachedCities();
        state = AsyncValue.data(cachedCities);
      } catch (cacheError) {
        state = AsyncValue.error(cacheError, StackTrace.current);
      }
    }
  }

  Future<void> searchCities(String searchTerm) async {
    if (searchTerm.isEmpty) {
      loadCities();
      return;
    }

    try {
      final filteredCities = await fetchCities.getSearchProduct(searchTerm);
      state = AsyncValue.data(filteredCities);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

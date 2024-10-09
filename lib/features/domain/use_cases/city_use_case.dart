/* External dependencies */
import 'package:injectable/injectable.dart';

/* Local dependencies */
import 'package:flutter_test_task/features/data/models/city_model.dart';
import 'package:flutter_test_task/features/domain/repositories/city_repository.dart';

@injectable
class FetchCityUseCase {
  final CityRepository repository;

  FetchCityUseCase(this.repository);

  Future<List<GetCityModel>> fetchCities() async =>
      await repository.fetchCities();

  Future<List<GetCityModel>> getSearchProduct(
    String searchTerm,
  ) async =>
      await repository.getSearchCity(
        searchTerm,
      );

  Future<List<GetCityModel>> getCachedCities() {
    return repository.getCachedCities();
  }
}

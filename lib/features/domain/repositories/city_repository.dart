/* Local dependencies */
import 'package:flutter_test_task/features/data/models/city_model.dart';

abstract class CityRepository {
  Future<List<GetCityModel>> fetchCities();
  Future<List<GetCityModel>> getSearchCity(String searchTerm);
  Future<List<GetCityModel>> getCachedCities();
}

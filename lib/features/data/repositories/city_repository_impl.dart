// lib/features/data/repositories/city_repository_impl.dart
/* External dependencies */
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

/* Local dependencies */
import 'package:flutter_test_task/features/data/models/city_model.dart';
import 'package:flutter_test_task/features/domain/repositories/city_repository.dart';
import 'package:flutter_test_task/helpers/api_requester.dart';
import 'package:flutter_test_task/helpers/catch_exception.dart';

@Injectable(as: CityRepository)
class CityRepositoryImpl implements CityRepository {
  final ApiRequester apiRequester;

  CityRepositoryImpl(this.apiRequester);

  @override
  Future<List<GetCityModel>> fetchCities() async {
    try {
      Response response = await apiRequester.toGet('locations/cities/');
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.data);
        List<GetCityModel> cities = List<GetCityModel>.from(
            jsonData.map((json) => GetCityModel.fromJson(json)));
        await _cacheCities(cities);
        return cities;
      } else {
        throw Exception('Не удалось загрузить данные: ${response.statusCode}');
      }
    } catch (e) {
      return await getCachedCities();
    }
  }

  @override
  Future<List<GetCityModel>> getSearchCity(String searchTerm) async {
    try {
      final Response response =
          await apiRequester.toGet('/locations/cities/?search=$searchTerm');
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.data);
        return List<GetCityModel>.from(
            jsonData.map((json) => GetCityModel.fromJson(json)));
      } else {
        throw Exception('Не удалось загрузить города: ${response.statusCode}');
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<void> _cacheCities(List<GetCityModel> cities) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> cityJsonList =
        cities.map((city) => json.encode(city.toJson())).toList();
    await prefs.setStringList('cachedCities', cityJsonList);
  }

  @override
  Future<List<GetCityModel>> getCachedCities() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? cityJsonList = prefs.getStringList('cachedCities');
    if (cityJsonList != null) {
      return cityJsonList
          .map((json) => GetCityModel.fromJson(jsonDecode(json)))
          .toList();
    }
    return [];
  }
}

/* External dependencies */
import 'package:freezed_annotation/freezed_annotation.dart';
part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class GetCityModel with _$GetCityModel {
  const factory GetCityModel({
    required String? name,
    required String? slug,
  }) = _GetCityModel;

  factory GetCityModel.fromJson(Map<String, dynamic> json) =>
      _$GetCityModelFromJson(json);
}

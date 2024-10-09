/* External dependencies */
import 'package:hooks_riverpod/hooks_riverpod.dart';

/* Local dependencies */
import 'package:flutter_test_task/features/data/repositories/city_repository_impl.dart';
import 'package:flutter_test_task/features/domain/repositories/city_repository.dart';
import 'package:flutter_test_task/helpers/api_requester.dart';

final cityRepositoryProvider = Provider<CityRepository>((ref) {
  return CityRepositoryImpl(ApiRequester());
});

/* External dependencies */
import 'package:hooks_riverpod/hooks_riverpod.dart';

/* Local dependencies */
import 'package:flutter_test_task/features/domain/use_cases/city_use_case.dart';
import 'package:flutter_test_task/features/providers/city_repository_provider.dart';

final fetchCityUseCaseProvider = Provider<FetchCityUseCase>((ref) {
  return FetchCityUseCase(ref.watch(cityRepositoryProvider));
});

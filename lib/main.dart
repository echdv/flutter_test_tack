/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/* Local dependencies */
import 'package:flutter_test_task/features/presentation/screens/get_cities_screen.dart';
import 'package:flutter_test_task/helpers/dependencies/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetListCitiesScreen(),
      ),
    );
  }
}

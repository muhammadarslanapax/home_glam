import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_glam/routes/app_routes.dart';
import 'package:home_glam/routes/routes_name.dart';
import 'package:home_glam/utils/app_colors.dart';
import 'package:home_glam/utils/sharedPref/sharedPref_helper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.initialize();

  lockOrientation();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return SafeArea(
          child: MaterialApp(
            initialRoute: RoutesName.splash,
            onGenerateRoute: AppRouteGenerator.onGenerateRoute,
            debugShowCheckedModeBanner: false,
            title: 'Home Glam',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}

void lockOrientation() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.pramiry));
}

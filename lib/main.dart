import 'package:banking_app/src/utils/color/color_prop.dart';
import 'package:banking_app/src/view/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: ColorProp.primaryColor,
              elevation: 0,
            ),
            textTheme: TextTheme(
              titleLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, height: 1.4),
              bodyMedium: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: ColorProp.primaryColor),
            ),
          ),
          title: 'First Method',
          home: child,
        );
      },
      child: const SplashView(),
    );
  }
}

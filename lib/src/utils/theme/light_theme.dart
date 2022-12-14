import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/color_prop.dart';

class LightTheme {
  static LightTheme? _instance;
  late final ThemeData _themeData;

  static LightTheme get instance {
    _instance ??= LightTheme._();
    return _instance!;
  }

  ThemeData get theme => _themeData;

  LightTheme._() {
    _themeData = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorProp.primaryColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600, height: 1.4),
        titleSmall: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, height: 1.4, color: ColorProp.asphaltBlue),
        bodyMedium: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: ColorProp.primaryColor),
        bodySmall: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: ColorProp.asphaltBlue),
      ),
    );
  }
}

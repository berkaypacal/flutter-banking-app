import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadiusProp extends Radius {
  RadiusProp.circularCard() : super.circular(12.r);
}

class BorderRadiusProp extends BorderRadius {
  BorderRadiusProp.circular() : super.circular(6.r);
}

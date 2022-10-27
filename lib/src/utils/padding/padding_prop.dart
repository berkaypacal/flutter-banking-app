import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingProp extends EdgeInsets {
  PaddingProp.symmetric() : super.symmetric(vertical: 15.h);
  PaddingProp.all() : super.all(20.h);
  PaddingProp.only() : super.only(top: 20.h);
}

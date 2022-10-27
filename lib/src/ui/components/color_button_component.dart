import 'package:banking_app/src/utils/radius/radius_prop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color/color_prop.dart';

class ColorButtonComponent extends StatelessWidget {
  const ColorButtonComponent({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          onPressed.call();
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: ColorProp.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusProp.circular()),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorProp.whiteColor),
        ),
      ),
    );
  }
}

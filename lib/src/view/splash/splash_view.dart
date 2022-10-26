import 'package:banking_app/src/utils/color/color_prop.dart';
import 'package:banking_app/src/utils/extensions/image_extension.dart';
import 'package:banking_app/src/utils/image/image_names.dart';
import 'package:banking_app/src/utils/padding/padding_prop.dart';
import 'package:banking_app/src/utils/radius/radius_prop.dart';
import 'package:banking_app/src/utils/strings/strings_prop.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/color_button_component.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsProps.splashTitle,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorProp.whiteColor),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 480.h - kToolbarHeight,
            decoration: _DecortationProp(),
            child: Image.asset(ImageNames.splash_mockup.toPng, height: 350.h),
          ),
          Column(
            children: [
              Padding(
                padding: PaddingProp.symmetric(),
                child: const _IndicatorComponent(),
              ),
              Padding(
                padding: PaddingProp.symmetric(),
                child: Text(
                  StringsProps.splashContent,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const _PagePadding.symmetric(),
                child: ColorButtonComponent(
                  title: StringsProps.signUp,
                  onPressed: () {},
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    StringsProps.login,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class _IndicatorComponent extends StatelessWidget {
  const _IndicatorComponent({
    Key? key,
  }) : super(key: key);
  final int _dotCount = 3;
  final double _position = 2;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: _dotCount,
      position: _position,
      decorator: DotsDecorator(
        color: ColorProp.palePeriwinkle,
        activeColor: ColorProp.primaryColor,
        shape: _dotShape(),
        size: Size(10.w, 5.h),
        spacing: _spacing(),
        activeSize: Size(20.w, 5.h),
        activeShape: _dotShape(),
      ),
    );
  }

  EdgeInsets _spacing() => EdgeInsets.symmetric(horizontal: 3.w);

  RoundedRectangleBorder _dotShape() => RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0));
}

class _DecortationProp extends BoxDecoration {
  _DecortationProp()
      : super(
          color: ColorProp.primaryColor,
          borderRadius: BorderRadius.vertical(bottom: RadiusProp.circularCard()),
        );
}

class _PagePadding extends EdgeInsets {
  const _PagePadding.symmetric() : super.symmetric(horizontal: 17, vertical: 10);
}

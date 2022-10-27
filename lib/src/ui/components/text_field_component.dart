import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color/color_prop.dart';
import '../../utils/radius/radius_prop.dart';

class TextFieldComponent extends StatefulWidget {
  const TextFieldComponent(
      {super.key,
      this.title,
      this.placeholder,
      this.validator,
      this.isPassword = false,
      this.controller,
      this.textInputType,
      this.textInputAction = TextInputAction.next});
  final String? title;
  final String? placeholder;
  final String? Function(String? value)? validator;
  final bool? isPassword;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  late final String? _title;
  late final String? _placeholder;
  late final String? Function(String? value)? _validator;
  late final bool? _isPassword;
  late final TextEditingController? _controller;
  late final TextInputType? _textInputType;
  late final TextInputAction? _textInputAction;

  bool isSecure = true;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _placeholder = widget.placeholder;
    _validator = widget.validator;
    _isPassword = widget.isPassword;
    _controller = widget.controller;
    _textInputType = widget.textInputType;
    _textInputAction = widget.textInputAction;
  }

  void changeSecure() {
    setState(() {
      isSecure = !isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title != null && _title != "" ? _titleComponent(context) : const SizedBox(),
        TextFormField(
          controller: _controller,
          textInputAction: _textInputAction,
          keyboardType: _textInputType,
          validator: (value) => _validator?.call(value),
          obscureText: !(_isPassword ?? false) ? false : isSecure,
          decoration: InputDecoration(
            suffixIcon: (_isPassword ?? false) ? _secureIcon() : null,
            labelText: _placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorProp.palePeriwinkle,
                ),
            fillColor: ColorProp.whiteColor,
            errorBorder: InputBorder(isError: true),
            focusedErrorBorder: InputBorder(isError: true),
            enabledBorder: InputBorder(),
            focusedBorder: InputBorder(),
          ),
        ),
      ],
    );
  }

  Column _titleComponent(BuildContext context) {
    return Column(
      children: [
        Text(
          _title ?? "",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorProp.asphaltBlue,
              ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }

  IconButton _secureIcon() {
    return IconButton(
      icon: Icon(
        isSecure ? Icons.visibility : Icons.visibility_off,
        color: ColorProp.palePeriwinkle,
      ),
      onPressed: () => changeSecure(),
    );
  }
}

class InputBorder extends OutlineInputBorder {
  final bool? isError;

  InputBorder({this.isError = false})
      : super(
          borderRadius: BorderRadiusProp.circular(),
          borderSide: BorderSide(
            color: (isError ?? false) ? ColorProp.grapeFruit : ColorProp.palePeriwinkle,
            width: 1.0,
          ),
        );
}

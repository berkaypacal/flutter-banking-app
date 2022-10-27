import 'package:auto_route/auto_route.dart';
import 'package:banking_app/src/ui/components/color_button_component.dart';
import 'package:banking_app/src/ui/components/text_field_component.dart';
import 'package:banking_app/src/utils/color/color_prop.dart';
import 'package:banking_app/src/utils/padding/padding_prop.dart';
import 'package:banking_app/src/utils/strings/strings_prop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/radius/radius_prop.dart';
import '../../../../utils/extensions/string_extension.dart';
import '../../../router/app_router.gr.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void goBack(BuildContext context) {
    context.navigateBack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorProp.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _TitleComponent(),
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 670.h - kToolbarHeight,
            decoration: _DecortationProp(),
            child: Padding(
              padding: PaddingProp.all(),
              child: Column(
                children: [
                  _GoBackButton(
                    onPressed: () {
                      goBack(context);
                    },
                  ),
                  _seperator(),
                  Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          TextFieldComponent(
                            textInputType: TextInputType.emailAddress,
                            title: StringsProps.email,
                            placeholder: StringsProps.emailPlaceholder,
                            validator: (value) => value?.validateEmail,
                            controller: controllerEmail,
                          ),
                          Padding(
                            padding: PaddingProp.only(),
                            child: TextFieldComponent(
                              textInputType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              title: StringsProps.password,
                              placeholder: StringsProps.passwordPlaceholder,
                              validator: (value) => value?.validatePassword,
                              isPassword: true,
                              controller: controllerPassword,
                            ),
                          )
                        ],
                      )),
                  const Align(
                    alignment: Alignment.topRight,
                    child: _ForgotPasswordComponent(),
                  ),
                  const Spacer(),
                  const _SignUpComponent(),
                  Padding(
                    padding: _PagePadding.only(),
                    child: ColorButtonComponent(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Logged in')),
                            );
                          }
                        },
                        title: StringsProps.login),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _seperator() {
    return const SizedBox(
      height: 10,
    );
  }
}

class _ForgotPasswordComponent extends StatelessWidget {
  const _ForgotPasswordComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {},
        child: Text(
          StringsProps.forgotPassword,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                decoration: TextDecoration.underline,
              ),
        ));
  }
}

class _SignUpComponent extends StatelessWidget {
  const _SignUpComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          StringsProps.dontHaveAccount,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextButton(
            onPressed: () {
              context.navigateTo(const RegisterRoute());
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              StringsProps.signUp,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(decoration: TextDecoration.underline, fontWeight: FontWeight.w600),
            )),
      ],
    );
  }
}

class _GoBackButton extends StatelessWidget {
  const _GoBackButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            onPressed.call();
          },
          icon: const Icon(Icons.close),
          color: ColorProp.palePeriwinkle,
        ));
  }
}

class _TitleComponent extends StatelessWidget {
  const _TitleComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      child: Text(
        StringsProps.login,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorProp.whiteColor),
      ),
    );
  }
}

class _DecortationProp extends BoxDecoration {
  _DecortationProp()
      : super(
          color: ColorProp.whiteColor,
          borderRadius: BorderRadius.vertical(top: RadiusProp.circularCard()),
        );
}

class _PagePadding extends EdgeInsets {
  _PagePadding.only() : super.only(bottom: 30.h);
}

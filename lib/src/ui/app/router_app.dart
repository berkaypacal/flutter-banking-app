import 'package:banking_app/src/utils/theme/light_theme.dart';
import 'package:flutter/material.dart';

import '../router/app_router.gr.dart';

class RouterApp extends StatefulWidget {
  const RouterApp({Key? key}) : super(key: key);

  @override
  State<RouterApp> createState() => _RouterAppState();
}

class _RouterAppState extends State<RouterApp> {
  late final AppRouter _appRouter;
  final String _appTitle = "Banking App";
  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: _appTitle,
      theme: LightTheme.instance.theme,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

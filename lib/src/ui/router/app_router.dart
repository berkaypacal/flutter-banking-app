import 'package:auto_route/auto_route.dart';
import 'package:banking_app/src/ui/view/auth/login/login_view.dart';
import 'package:banking_app/src/ui/view/auth/register/register_view.dart';
import 'package:banking_app/src/ui/view/auth/splash/splash_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AuthScreenView, path: "authapp", initial: true, children: [
      AutoRoute(page: SplashView, path: "authdash", initial: true),
      AutoRoute(page: LoginView, path: "login"),
      AutoRoute(page: RegisterView, path: "register"),
    ]),
  ],
)
// extend the generated private router
class $AppRouter {}

class AuthScreenView extends AutoRouter {
  const AuthScreenView({super.key});
}

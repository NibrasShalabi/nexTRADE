import 'package:go_router/go_router.dart';
import 'package:nextrade/presentation/screens/login/login_screen.dart';
import 'package:nextrade/presentation/screens/signup/signup_screen.dart';
import 'package:nextrade/presentation/screens/splash/splash_screen.dart';


abstract class AppRouter{

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const SplashScreen()
      ),
      GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen()
      ),
      GoRoute(
          path: '/Sing',
          builder: (context, state) => const SignupScreen()
      ),
      // GoRoute(
      //     path: '/searchView',
      //     builder: (context, state) => const SearchView()
      // ),

    ],
  );

}
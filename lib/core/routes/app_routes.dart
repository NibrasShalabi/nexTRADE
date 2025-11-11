import 'package:go_router/go_router.dart';
import 'package:nextrade/presentation/screens/home/home_screen.dart';
import 'package:nextrade/presentation/screens/login/login_screen.dart';
import 'package:nextrade/presentation/screens/settings/user_settings_screen.dart';
import 'package:nextrade/presentation/screens/signup/signup_screen.dart';
import 'package:nextrade/presentation/screens/splash/splash_screen.dart';
import 'package:nextrade/presentation/screens/withdraw/withdraw_screen.dart';
import '../../presentation/screens/deposit/deposit_screen.dart';
import '../../presentation/screens/referral/referral_screen.dart';
import '../../presentation/screens/transactions/transactions_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/asda', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/Sing', builder: (context, state) => const SignUpScreen()),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: '/deposit',
        builder: (context, state) => const DepositScreen(),
      ), GoRoute(
        path: '/withdraw',
        builder: (context, state) => const WithdrawScreen(),
      ),GoRoute(
        path: '/transactions',
        builder: (context, state) => const TransactionsScreen(),
      ),GoRoute(
        path: '/referral',
        builder: (context, state) => const ReferralScreen(),
      ),GoRoute(
        path: '/',
        builder: (context, state) => const UserSettingsScreen(),
      ),
    ],
  );
}

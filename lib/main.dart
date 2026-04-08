import 'package:flutter/material.dart';

import 'screens/activity_logs_screen.dart';
import 'screens/delivery_form_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/monitoring_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';
import 'services/firebase_service.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initialize();
  runApp(const DeliboxApp());
}

abstract final class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String monitoring = '/monitoring';
  static const String deliveryForm = '/delivery-form';
  static const String activityLogs = '/activity-logs';
}

class DeliboxApp extends StatelessWidget {
  const DeliboxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delibox',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.signup: (_) => const SignupScreen(),
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.monitoring: (_) => const MonitoringScreen(),
        AppRoutes.deliveryForm: (_) => const DeliveryFormScreen(),
        AppRoutes.activityLogs: (_) => const ActivityLogsScreen(),
      },
    );
  }
}

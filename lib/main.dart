import 'package:demoz/features/auth/presentation/pages/register.dart';
import 'package:demoz/features/auth/presentation/pages/signin.dart';
import 'package:demoz/onboarding.dart';
import 'package:demoz/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/auth/data/datasources/auth_data_source.dart';
import 'features/auth/data/datasources/auth_imp_api.dart';
import 'features/auth/data/models/company.dart';
import 'features/auth/data/repositories/auth_repo.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/employe/data/models/employee.dart';
import 'features/employe/presentation/pages/employee.dart';
import 'features/payroll/presentation/pages/calendar.dart';
import 'features/home/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register the adapter for your model (ensure this matches your model class)
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(EmployeeAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthDataSource>(
            create: (context) => AuthImpApi(),
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) =>
                AuthRepository(dataSource: context.read<AuthDataSource>()),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) =>
                  AuthBloc(authRepository: context.read<AuthRepository>()),
            ),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Demoz',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case '/':
                    return MaterialPageRoute(
                        builder: (context) => const SplashScreen());
                  case '/onboarding':
                    return MaterialPageRoute(
                        builder: (context) => const OnboardingScreen());
                  case '/signin':
                    return MaterialPageRoute(
                        builder: (context) => const SignInPage());
                  case '/register':
                    final args = settings.arguments as Map<String, String>;
                    return MaterialPageRoute(
                        builder: (context) => RegisterPage(
                              email: args['email'] ?? '',
                              password: args['password'] ?? '',
                            ));
                  case '/home':
                    return MaterialPageRoute(
                        builder: (context) => const HomePage());
                  case '/calendar':
                    return MaterialPageRoute(
                        builder: (context) => const CalendarPage());
                  case '/employee':
                    return MaterialPageRoute(
                        builder: (context) => const EmployeeScreen());
                  default:
                    return MaterialPageRoute(
                        builder: (context) => const SplashScreen());
                }
              }),
        ));
  }
}

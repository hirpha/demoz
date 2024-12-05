import 'package:demoz/features/auth/presentation/pages/register.dart';
import 'package:demoz/features/auth/presentation/pages/signin.dart';
import 'package:demoz/features/employe/presentation/bloc/employe_bloc.dart';
import 'package:demoz/features/home/presentation/pages/settings.dart';
import 'package:demoz/onboarding.dart';
import 'package:demoz/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/auth/data/datasources/auth_data_source.dart';
import 'features/auth/data/datasources/auth_imp_api.dart';
import 'features/auth/data/models/company.dart';
import 'features/auth/data/repositories/auth_repo.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/employe/data/datasources/employee_data_source.dart';
import 'features/employe/data/datasources/employee_imp_api.dart';
import 'features/employe/data/models/employee.dart';
import 'features/employe/data/repositories/employe_repo.dart';
import 'features/employe/presentation/pages/employee.dart';
import 'features/payroll/presentation/pages/calendar.dart';
import 'features/home/presentation/pages/home.dart';

late Box<Company> companyBox;
late Box<Employee> employeeBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromARGB(255, 255, 255, 255),
    statusBarIconBrightness: Brightness.dark,
  ));
  // Initialize Hive
  await Hive.initFlutter();

  // Register the adapter for your model (ensure this matches your model class)
  Hive.registerAdapter(CompanyAdapter());
  Hive.registerAdapter(EmployeeAdapter());
  companyBox = await Hive.openBox<Company>('companyBox');
  employeeBox = await Hive.openBox<Employee>('employee');
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
          RepositoryProvider<EmployeeDataSource>(
            create: (context) => EmployeeImpApi(),
          ),
          RepositoryProvider<EmployeRepo>(
              create: (context) => EmployeRepo(
                  employeeDataSource: context.read<EmployeeDataSource>())),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) =>
                  AuthBloc(authRepository: context.read<AuthRepository>()),
            ),
            BlocProvider<EmployeBloc>(
              create: (context) =>
                  EmployeBloc(employeRepo: context.read<EmployeRepo>()),
            ),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Demoz',
              theme: ThemeData(
                fontFamily: 'Poppins',
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
                    final args = settings.arguments as String;
                    return MaterialPageRoute(
                        builder: (context) => SignInPage(
                              login: args,
                            ));
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
                  case '/settings':
                    return MaterialPageRoute(
                        builder: (context) => const Settings());
                  default:
                    return MaterialPageRoute(
                        builder: (context) => const SplashScreen());
                }
              }),
        ));
  }
}

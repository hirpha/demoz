import 'package:demoz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:demoz/features/auth/presentation/pages/register.dart';
import 'package:demoz/features/auth/presentation/widgets/textfiled.dart';
import 'package:demoz/features/employe/presentation/bloc/employe_bloc.dart';
import 'package:demoz/features/home/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';

class MockAuthBloc extends Mock implements AuthBloc {}

class FakeAuthEvent extends Fake implements AuthEvent {}

class FakeAuthState extends Fake implements AuthState {}

class MockEmployeBloc extends Mock implements EmployeBloc {}

class FakeEmployeEvent extends Fake implements EmployeEvent {}

class FakeEmployeState extends Fake implements EmployeState {}

void main() {
  late MockAuthBloc mockAuthBloc;
  late MockEmployeBloc mockEmployeBloc;

  setUpAll(() {
    registerFallbackValue(FakeAuthEvent());
    registerFallbackValue(FakeAuthState());
    registerFallbackValue(FakeEmployeEvent());
    registerFallbackValue(FakeEmployeState());
  });

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    mockEmployeBloc = MockEmployeBloc();
  });

  testWidgets('should navigate to HomePage after successful registration',
      (WidgetTester tester) async {
    // Mocking the AuthBloc to return successful registration state
    when(() => mockAuthBloc.state).thenReturn(AuthRegisterSuccess());

    // Providing the MaterialApp with correct route handling
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: mockAuthBloc,
          child:
              RegisterPage(email: 'test@example.com', password: 'password123'),
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/home') {
            return MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                      value: mockEmployeBloc,
                      child: const HomePage(),
                    ));
          }
          return null;
        },
      ),
    );

    // Simulate registration success
    await tester.pumpAndSettle(); // Ensure the navigation has time to happen

    // Verify navigation to HomePage
    expect(find.byType(HomePage), findsOneWidget); // Ensure HomePage is found

    // Check for specific UI components on the HomePage
    expect(find.text('Home'), findsOneWidget); // Home page title
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.note), findsOneWidget);
    expect(find.byIcon(Icons.account_circle), findsOneWidget);
    expect(find.text('Number of Employees'), findsOneWidget); // Dashboard info
  });

  testWidgets('should show loading spinner during dashboard loading',
      (WidgetTester tester) async {
    when(() => mockAuthBloc.state).thenReturn(AuthRegisterSuccess());

    // Mocking the employee bloc state to simulate a loading state for the dashboard
    when(() => mockEmployeBloc.state).thenReturn(EmployeGetDashboardLoading());

    // Providing the MaterialApp with correct route handling
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: mockAuthBloc,
          child:
              RegisterPage(email: 'test@example.com', password: 'password123'),
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/home') {
            return MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                      value: mockEmployeBloc,
                      child: const HomePage(),
                    ));
          }
          return null;
        },
      ),
    );

    // Simulate registration success and trigger dashboard loading
    await tester.pumpAndSettle(); // Ensure the navigation has time to happen

    // Verify that loading spinner is shown while the dashboard is loading
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

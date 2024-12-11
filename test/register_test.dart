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

// Mock and Fake classes
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

  testWidgets('should dispatch AuthRegisterEvent on valid submission',
      (WidgetTester tester) async {
    // Setting the initial state of the mock AuthBloc
    when(() => mockAuthBloc.state).thenReturn(AuthInitial());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: mockAuthBloc,
          child:
              RegisterPage(email: 'test@example.com', password: 'password123'),
        ),
      ),
    );

    // Fill in the text fields
    await tester.enterText(find.byType(TextFieldWidget).first, 'Test Company');
    await tester.enterText(
        find.byType(TextFieldWidget).at(1), '123 Test Street');
    await tester.enterText(find.byType(TextFieldWidget).at(2), '1234567890');
    await tester.enterText(find.byType(TextFieldWidget).at(3), '12345');
    await tester.enterText(find.byType(TextFieldWidget).at(4), '10');
    await tester.enterText(find.byType(TextFieldWidget).at(5), 'Test Bank');
    await tester.enterText(find.byType(TextFieldWidget).at(6), '1234567890');

    // Tap the submit button
    await tester.tap(find.text('Submit Proposal'));
    await tester.pump();

    // Verify that an AuthRegisterEvent has been dispatched
    verify(() => mockAuthBloc.add(any<AuthEvent>())).called(1);
  });

  testWidgets('should navigate to home on successful registration',
      (WidgetTester tester) async {
    // Setting the state of the mock AuthBloc to success
    when(() => mockAuthBloc.state).thenReturn(AuthRegisterSuccess());

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

    // Trigger the success state
    await tester.pump();

    // Verify navigation to home page
    expect(find.text('Home'), findsOneWidget);
  });
}


import 'package:demoz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:demoz/features/auth/presentation/pages/signin.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    when(() => mockAuthBloc.state).thenReturn(AuthInitial());
    when(() => mockAuthBloc.stream).thenAnswer((_) => Stream.empty());
  });

  Widget createWidgetUnderTest({required String login}) {
    return MaterialApp(
      home: BlocProvider<AuthBloc>.value(
        value: mockAuthBloc,
        child: SignInPage(login: login),
      ),
    );
  }

  group('SignInPage Tests', () {
    testWidgets('renders initial UI elements', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(login: 'signin'));
      await tester.pumpAndSettle();

      expect(find.text('Welcome  👋\nto Demoz Payroll'), findsOneWidget);
    });

    testWidgets('shows validation errors for empty fields', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(login: 'signin'));

      // Simulate entering and clearing email field
      await tester.enterText(
          find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).first, '');
      await tester.pumpAndSettle();

      expect(find.text('Email is required'), findsOneWidget);
    });

    testWidgets('shows validation error for invalid email', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(login: 'signin'));

      await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
      await tester.pump();

      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('toggles password visibility', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(login: 'signin'));

      final visibilityToggle = find.byIcon(Icons.visibility);
      await tester.tap(visibilityToggle);
      await tester.pump();

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets('calls AuthCheckEmailEvent with valid input', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest(login: 'signin'));

      // Enter valid email and password
      await tester.enterText(
          find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'Password123');
      await tester.pump();

      final signInButton = find.byType(ElevatedButton);
      await tester.tap(signInButton);
      await tester.pump();

      verify(() =>
              mockAuthBloc.add(AuthCheckEmailEvent(email: 'test@example.com')))
          .called(1);
    });

    testWidgets('shows loading state', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(AuthLoading());

      await tester.pumpWidget(createWidgetUnderTest(login: 'signin'));
      await tester.pump();

      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('shows error snackbar on auth failure', (tester) async {
      when(() => mockAuthBloc.stream).thenAnswer(
        (_) => Stream<AuthState>.fromIterable(
          [AuthFailure(message: 'Invalid email or password')],
        ),
      );
      when(() => mockAuthBloc.state)
          .thenReturn(AuthFailure(message: 'Invalid email or password'));

      await tester.pumpWidget(createWidgetUnderTest(login: 'signin'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Invalid email or password'), findsOneWidget);
    });
  });
}

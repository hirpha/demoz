import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

import '../../../../main.dart';
import '../datasources/auth_data_source.dart';
import '../models/company.dart';

class AuthImpApi extends AuthDataSource {
  @override
  Future<Company> signIn(String email, String password) async {
    try {
      log('signing in with email: $email and password: $password');
      var company = companyBox.values.firstWhere(
        (c) => c.email?.toLowerCase() == email.toLowerCase(),
        orElse: () => throw Exception('Email not found'),
      );
      log('found company: ${company.email}');
      if (company.password == password) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('companyId', company.companyId!);
        return company;
      }
      throw Exception('Invalid email or password');
    } catch (e) {
      log('error: $e');
      throw Exception('Invalid email or password');
    }
  }

  @override
  Future<bool> register(Company company) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      log('registering company');
      log(company.toString());
      bool isEmailTaken = await checkEmail(company.email!);

      if (isEmailTaken) {
        throw Exception('Email already taken');
      }

      if (company.companyId == null || company.companyId!.isEmpty) {
        throw Exception('Company ID cannot be null or empty');
      }

      prefs.setString('companyId', company.companyId!);
      await companyBox.add(company);
      return true;
    } catch (e) {
      log('error: $e');
      throw Exception('Failed to register company');
    }
  }

  @override
  Future<Company> getCompany(String companyId) async {
    try {
      var company = companyBox.values.firstWhere(
        (c) => c.companyId == companyId,
        orElse: () => throw Exception('Company not found'),
      );
      return company;
    } catch (e) {
      log('error: $e');
      throw Exception('Company not found');
    }
  }

  @override
  Future<bool> checkEmail(String email) async {
    return companyBox.values.any((c) => c.email == email);
  }
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datasources/auth_data_source.dart';
import 'dart:developer';
import '../models/company.dart';

class AuthImpApi extends AuthDataSource {
  @override
  Future<Company> signIn(String email, String password) async {
    var box = await Hive.openBox<Company>('companyBox');
    var company = box.values.firstWhere((c) => c.email == email);
    if (company.password == password) {
      return company;
    }
    throw Exception('Invalid email or password');
  }

  @override
  Future<bool> register(Company company) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log('registering company');
    log(company.toString());
    var box = await Hive.openBox<Company>('companyBox');
    prefs.setString('companyId', company.companyId ?? '');
    await box.add(company);
    return true;
  }

  @override
  Future<Company> getCompany(String companyId) async {
    var box = await Hive.openBox<Company>('companyBox');
    return box.values.firstWhere((c) => c.companyId == companyId);
  }
}

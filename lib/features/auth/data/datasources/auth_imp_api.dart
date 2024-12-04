import 'package:hive_flutter/hive_flutter.dart';

import '../datasources/auth_data_source.dart';
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
    var box = await Hive.openBox<Company>('companyBox');
    await box.add(company);
    return true;
  }
}

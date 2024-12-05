import '../datasources/auth_data_source.dart';
import '../models/company.dart';

class AuthRepository {
  final AuthDataSource dataSource;

  AuthRepository({required this.dataSource});

  Future<void> signIn(String email, String password) async {
    try {
      await dataSource.signIn(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> register(Company company) async {
    try {
      return await dataSource.register(company);
    } catch (e) {
      rethrow;
    }
  }

  Future<Company> getCompany(String companyId) async {
    try {
      return await dataSource.getCompany(companyId);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkEmail(String email) async {
    try {
      return await dataSource.checkEmail(email);
    } catch (e) {
      rethrow;
    }
  }
}

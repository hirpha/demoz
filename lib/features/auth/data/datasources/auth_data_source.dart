import '../models/company.dart';

abstract class AuthDataSource {
  Future<Company> signIn(String email, String password);
  Future<bool> register(Company company);
  Future<Company> getCompany(String companyId);
}

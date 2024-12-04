import '../datasources/auth_data_source.dart';
import '../models/company.dart';

class AuthRepository {
  final AuthDataSource dataSource;

  AuthRepository({required this.dataSource});

  Future<void> signIn(String email, String password) async {
    await dataSource.signIn(email, password);
  }

  Future<bool> register(Company company) async {
    return await dataSource.register(company);
  }

  Future<Company> getCompany(String companyId) async {
    return await dataSource.getCompany(companyId);
  }
}

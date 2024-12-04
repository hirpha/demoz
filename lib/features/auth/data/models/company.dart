import 'package:hive/hive.dart';

part 'company.g.dart'; // This will be generated later.

@HiveType(typeId: 0) // Assign a unique ID for the adapter.
class Company extends HiveObject {
  @HiveField(0)
  String? email;

  @HiveField(1)
  String? password;

  @HiveField(2)
  String? companyName;

  @HiveField(3)
  String? companyAddress;

  @HiveField(4)
  String? phoneNumber;

  @HiveField(5)
  String? tinNumber;

  @HiveField(6)
  int? numberOfEmployees;

  @HiveField(7)
  String? companyBank;

  @HiveField(8)
  String? bankAccountNumber;

  Company({
    this.email,
    this.password,
    this.companyName,
    this.companyAddress,
    this.phoneNumber,
    this.tinNumber,
    this.numberOfEmployees,
    this.companyBank,
    this.bankAccountNumber,
  });
}

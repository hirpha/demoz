import 'package:hive/hive.dart';

part 'company.g.dart'; // This will be generated later.

@HiveType(typeId: 0) // Assign a unique ID for the adapter.
class Company extends HiveObject {
  @HiveField(0)
  String? email;

  @HiveField(1)
  String? companyId;

  @HiveField(2)
  String? password;

  @HiveField(3)
  String? companyName;

  @HiveField(4)
  String? companyAddress;

  @HiveField(5)
  String? phoneNumber;

  @HiveField(6)
  String? tinNumber;

  @HiveField(7)
  int? numberOfEmployees;

  @HiveField(8)
  String? companyBank;

  @HiveField(9)
  String? bankAccountNumber;

  Company({
    this.companyId,
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

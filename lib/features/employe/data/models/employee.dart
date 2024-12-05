import 'package:hive/hive.dart';

part 'employee.g.dart'; // This will be generated later.

@HiveType(typeId: 1) // Assign a unique ID for the adapter.
class Employee extends HiveObject {
  @HiveField(0)
  String? email;

  @HiveField(1)
  String? empoyeeId;

  @HiveField(2)
  String? password;

  @HiveField(3)
  String? employeeName;

  @HiveField(4)
  String? employeeAddress;

  @HiveField(5)
  String? phoneNumber;

  @HiveField(6)
  String? tinNumber;

  @HiveField(7)
  double? grossSalary;

  @HiveField(8)
  String? taxableEarnings;

  @HiveField(9)
  String? startDate;

  @HiveField(10)
  String? companyId;

  @HiveField(11)
  String? gender;

  Employee({
    this.empoyeeId,
    this.email,
    this.password,
    this.employeeName,
    this.employeeAddress,
    this.phoneNumber,
    this.tinNumber,
    this.grossSalary,
    this.taxableEarnings,
    this.startDate,
    this.companyId,
    this.gender,
  });
}

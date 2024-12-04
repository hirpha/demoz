// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeAdapter extends TypeAdapter<Employee> {
  @override
  final int typeId = 1;

  @override
  Employee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Employee(
      empoyeeId: fields[1] as String?,
      email: fields[0] as String?,
      password: fields[2] as String?,
      employeeName: fields[3] as String?,
      employeeAddress: fields[4] as String?,
      phoneNumber: fields[5] as String?,
      tinNumber: fields[6] as String?,
      grossSalary: fields[7] as double?,
      taxableEarnings: fields[8] as String?,
      startDate: fields[9] as String?,
      companyId: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Employee obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.empoyeeId)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.employeeName)
      ..writeByte(4)
      ..write(obj.employeeAddress)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.tinNumber)
      ..writeByte(7)
      ..write(obj.grossSalary)
      ..writeByte(8)
      ..write(obj.taxableEarnings)
      ..writeByte(9)
      ..write(obj.startDate)
      ..writeByte(10)
      ..write(obj.companyId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

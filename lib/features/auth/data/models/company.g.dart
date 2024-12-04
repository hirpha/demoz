// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyAdapter extends TypeAdapter<Company> {
  @override
  final int typeId = 0;

  @override
  Company read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Company(
      companyId: fields[1] as String?,
      email: fields[0] as String?,
      password: fields[2] as String?,
      companyName: fields[3] as String?,
      companyAddress: fields[4] as String?,
      phoneNumber: fields[5] as String?,
      tinNumber: fields[6] as String?,
      numberOfEmployees: fields[7] as int?,
      companyBank: fields[8] as String?,
      bankAccountNumber: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Company obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.companyId)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.companyName)
      ..writeByte(4)
      ..write(obj.companyAddress)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.tinNumber)
      ..writeByte(7)
      ..write(obj.numberOfEmployees)
      ..writeByte(8)
      ..write(obj.companyBank)
      ..writeByte(9)
      ..write(obj.bankAccountNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

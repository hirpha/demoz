import 'package:demoz/features/employe/data/models/employee.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Employee test', () {
    final employee = Employee(
      employeeId: '1',
      name: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
    );
    expect(employee.employeeId, '1');
  });
}

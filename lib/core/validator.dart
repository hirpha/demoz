String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }

  // Regular expression for email validation
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email';
  }

  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }

  if (value.length < 2) {
    return 'Name must be at least 2 characters';
  }

  // Only letters and spaces allowed
  final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
  if (!nameRegex.hasMatch(value)) {
    return 'Name can only contain letters';
  }

  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }

  // Ethiopian phone number format
  final phoneRegex = RegExp(r'^\+251[0-9]{9}$|^0[0-9]{9}$');
  if (!phoneRegex.hasMatch(value)) {
    return 'Please enter a valid Ethiopian phone number';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }

  // At least one uppercase, one lowercase, one number
  // final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$');
  // if (!passwordRegex.hasMatch(value)) {
  //   return 'Password must contain uppercase, lowercase and number';
  // }

  return null;
}

String? tinNumberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'TIN number is required';
  }

  // Ethiopian TIN number format (10 digits)
  final tinRegex = RegExp(r'^\d{10}$');
  if (!tinRegex.hasMatch(value)) {
    return 'Please enter a valid 10-digit TIN number';
  }

  return null;
}

String? salaryValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Salary is required';
  }

  // Check if it's a valid number
  final number = double.tryParse(value);
  if (number == null) {
    return 'Please enter a valid number';
  }

  if (number < 0) {
    return 'Salary cannot be negative';
  }

  return null;
}

String? dateValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Date is required';
  }

  try {
    final date = DateTime.parse(value);
    if (date.isAfter(DateTime.now())) {
      return 'Date cannot be in the future';
    }
  } catch (e) {
    return 'Please enter a valid date';
  }

  return null;
}

String? genderValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Gender is required';
  }

  final validGenders = ['Male', 'Female'];
  if (!validGenders.contains(value)) {
    return 'Please select a valid gender';
  }

  return null;
}

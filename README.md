# Flutter Demoz(Salary) Management System

A Flutter project for managing employees and companies using Hive for local storage. This project includes features for:

- Registering and signing in companies.
- Managing employees (create, update, delete).
- Calculating salaries, pensions, income taxes, and more.
- Selecting dates using a built-in date picker.
- Importing/exporting data using CSV files.

---

## Features

- **Bloc Architecture**: State management with `flutter_bloc` for scalability.
- **Hive Integration**: Local storage for companies and employees.
- **Shared Preferences**: Store simple key-value data like user sessions.
- **Date Picker**: Select dates easily within the app.
- **Gross Salary Calculations**: Derive net salary, pension, taxable earnings, and income tax.
- **CSV Integration**: Import and export data using CSV files.
- **UUID Generation**: Generate unique IDs for companies and employees.

---


## Getting Started

### Prerequisites

Ensure you have the following installed on your system:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- [Hive](https://docs.hivedb.dev/) package and Hive Generator for Flutter
- [Intl Package](https://pub.dev/packages/intl) for date formatting (optional)

---

### Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-repo/flutter-employee-management.git
   cd flutter-employee-management



---

### Adding the CSV File:

#### File: `employee_data.csv`

```csv
Employee ID,Name,Gross Salary,Pension Rate,Company ID
E001,John Doe,2000,7,C001
E002,Jane Smith,3000,7,C001
E003,Bob Johnson,2500,8,C002
```

### Download Employee Data

You can download the sample employee data CSV file for this project:

[Download employee_data.zip](https://github.com/hirpha/demoz/raw/main/employee_data.zip)

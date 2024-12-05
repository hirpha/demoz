class Dashboard {
  final int numberOfEmployees;
  final double incomeTax;
  final double pensionTax;
  final double performance;
  final double taxSummary;
  final int numberOfMales;
  final int numberOfFemales;

  Dashboard({
    required this.numberOfEmployees,
    required this.incomeTax,
    required this.pensionTax,
    required this.performance,
    required this.taxSummary,
    required this.numberOfMales,
    required this.numberOfFemales,
  });

  // Factory constructor to create a Dashboard object from JSON
  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
      numberOfEmployees: json['number_of_employees'] ?? 0,
      incomeTax: (json['income_tax'] ?? 0).toDouble(),
      pensionTax: (json['pension_tax'] ?? 0).toDouble(),
      performance: (json['performance'] ?? 0).toDouble(),
      taxSummary: (json['tax_summary'] ?? 0).toDouble(),
      numberOfMales: json['number_of_males'] ?? 0,
      numberOfFemales: json['number_of_females'] ?? 0,
    );
  }

  double get malePercentage {
    if (numberOfEmployees == 0) {
      return 0.0; // Avoid division by zero
    }
    if (numberOfMales == 0) {
      return 0.0;
    }
    return (numberOfMales / numberOfEmployees) * 100;
  }

  double get femalePercentage {
    if (numberOfEmployees == 0) {
      return 0.0; // Avoid division by zero
    }
    if (numberOfFemales == 0) {
      return 0.0;
    }
    return (numberOfFemales / numberOfEmployees) * 100;
  }
}

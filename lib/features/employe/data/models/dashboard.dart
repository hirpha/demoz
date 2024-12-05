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
}

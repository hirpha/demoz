import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../employe/data/models/dashboard.dart';

class EmployeeComposition extends StatelessWidget {
  final Dashboard dashboard;
  const EmployeeComposition({super.key, required this.dashboard});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Employee Composition",
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 25.0,
                    percent: 0.65,
                    backgroundColor: Colors.transparent,
                    progressColor: const Color(0xFF16C098),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CircularPercentIndicator(
                    radius: 53.0,
                    lineWidth: 30.0,
                    reverse: true,
                    percent: 0.35,
                    backgroundColor: Colors.transparent,
                    progressColor: const Color(0xFF5932EA),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: -10,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/female.png",
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${dashboard.femalePercentage.toStringAsFixed(2)}  %",
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/male.png",
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${dashboard.malePercentage.toStringAsFixed(2)}  %",
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            "${dashboard.numberOfEmployees} employee total",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(IconData icon, String percentage, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(width: 8.0),
        Text(
          percentage,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

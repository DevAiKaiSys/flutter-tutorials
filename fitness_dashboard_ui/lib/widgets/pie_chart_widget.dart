import 'package:fitness_dashboard_ui/data/pie_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    final pieChartData = ChartData();

    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 70,
          startDegreeOffset: -90,
          sections: pieChartData.paiChartSelectionDatas,
        ),
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 35,
                startDegreeOffset: -10,
                sections: paiChartSelectionDatas),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 2),
                Text("2022",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: Color.fromARGB(255, 6, 94, 165),
    value: 20,
    showTitle: false,
    radius: 20,
  ),
  PieChartSectionData(
    color: Color.fromARGB(255, 224, 0, 0),
    value: 10,
    showTitle: false,
    radius: 20,
  ),
  PieChartSectionData(
    color: Color.fromARGB(255, 138, 0, 138),
    value: 15,
    showTitle: false,
    radius: 20,
  ),
];

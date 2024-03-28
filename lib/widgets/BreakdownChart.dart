import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SyncfusionCustomRadiusPieChart extends StatefulWidget {
  final String? focusCategory;

  const SyncfusionCustomRadiusPieChart({Key? key, this.focusCategory})
      : super(key: key);

  @override
  State<SyncfusionCustomRadiusPieChart> createState() =>
      SyncfusionCustomRadiusPieChartState();
}

class SyncfusionCustomRadiusPieChartState
    extends State<SyncfusionCustomRadiusPieChart> {
  List<Color> chartColors = [
    const Color.fromRGBO(75, 135, 185, 1),
    const Color.fromRGBO(192, 108, 132, 1),
    const Color.fromRGBO(246, 114, 128, 1),
    const Color.fromRGBO(248, 177, 149, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('payments').get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return Image.asset('assets/nodt.png');
        }

        // Map<String, double> categoryTotals = {};
        double focusCategoryTotal = 0; // Total for the focused category
        double othersTotal = 0; // Total for all other categories

        for (var doc in snapshot.data!.docs) {
          var category = doc['category'];
          var amount = doc['amount'];

          if (category == widget.focusCategory) {
            focusCategoryTotal += amount;
          } else {
            othersTotal += amount;
          }
        }

        List<ChartData> chartData = [];

        if (widget.focusCategory != null) {
          chartData.add(
              ChartData(widget.focusCategory!, focusCategoryTotal, '100%'));
        }

        chartData.add(ChartData('Others', othersTotal, '0%'));

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SfCircularChart(
              margin: EdgeInsets.zero,
              series: <CircularSeries>[
                DoughnutSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  innerRadius: '10%',
                  radius: '25%',
                  explode: true,
                  explodeAll: true,
                  pointRadiusMapper: (ChartData data, _) => data.size,
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.size);
  final String x;
  final double y;
  final String size;
}

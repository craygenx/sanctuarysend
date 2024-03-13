import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/custom_bold_txt.dart';


// class SyncfusionCustomRadiusPieChart extends StatefulWidget {
//   const SyncfusionCustomRadiusPieChart({super.key});
//
//   @override
//   State<SyncfusionCustomRadiusPieChart> createState() => SyncfusionCustomRadiusPieChartState();
// }
//
// class SyncfusionCustomRadiusPieChartState extends State<SyncfusionCustomRadiusPieChart> {
//   List<Color> chartColors = [
//     const Color.fromRGBO(75, 135, 185, 1),
//     const Color.fromRGBO(192, 108, 132, 1),
//     const Color.fromRGBO(246, 114, 128, 1),
//     const Color.fromRGBO(248, 177, 149, 1),
//   ];
//   int colorIndex = 0;
//   int colorIndx = 0;
//   List<String> percentages = ['0%','95%', '85%', '77%', '55%'];
//   int pIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: FirebaseFirestore.instance.collection('payments').get(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const CircularProgressIndicator();
//         }
//
//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }
//
//         // Process data and calculate totals for each category
//         Map<String, double> categoryTotals = {};
//
//         for (var doc in snapshot.data!.docs) {
//           var category = doc['category'];
//           var amount = doc['amount'];
//
//           if (categoryTotals.containsKey(category)) {
//             categoryTotals[category] = (categoryTotals[category]! + amount);
//           } else {
//             categoryTotals[category] = amount;
//           }
//         }
//
//         // Sort the categories by total amount
//         var sortedCategories = categoryTotals.entries.toList()
//           ..sort((a, b) => b.value.compareTo(a.value));
//
//         // Take the top 4 categories
//         var topCategories = sortedCategories.take(4).toList();
//
//
//         // Calculate the total for 'Others'
//         var othersTotal = sortedCategories.sublist(4).fold(0, (prev, element) => (prev + element.value).toInt());
//
//         // Create chart data
//         List<ChartData> chartData = topCategories.map((entry) {
//           pIndex ++;
//           return ChartData(entry.key, entry.value, percentages[pIndex]);
//         }).toList();
//
//         // Add 'Others' category
//         chartData.add(ChartData('Others', othersTotal.toDouble(), '0%'));
//
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             if(MediaQuery.of(context).size.width > 600)
//               SizedBox(
//               height: MediaQuery.of(context).size.height * 0.6,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   for (var category in topCategories)
//                     SizedBox(
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 10,
//                             width: 10,
//                             color: chartColors[colorIndex % chartColors.length],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8.0),
//                             child: BoldText(text: category.key),
//                           ),
//                         ]
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//             SfCircularChart(
//               margin: EdgeInsets.zero,
//               series: <CircularSeries>[
//                 DoughnutSeries<ChartData, String>(
//                   dataSource: chartData,
//                   xValueMapper: (ChartData data, _) => data.x,
//                   yValueMapper: (ChartData data, _) => data.y,
//                   innerRadius: '10%',
//                   radius: '25%',
//                   explode: true,
//                   explodeAll: true,
//                   pointRadiusMapper: (ChartData data, _) => data.size,
//                 )
//               ],
//             ),
//             SizedBox(
//                 width: MediaQuery.of(context).size.width * 1/4,
//                 height: MediaQuery.of(context).size.height * 0.6,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     for (var category in topCategories)
//                       Container(
//                         height: 40,
//                         width: 100,
//                         color: chartColors[colorIndex % chartColors.length],
//                         child: Column(
//                           children: [
//                             BoldText(text: category.key),
//                             BoldText(text: '${category.value}')
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class ChartData {
//   ChartData(this.x, this.y, this.size);
//   final String x;
//   final double y;
//   final String size;
// }

// ... (existing imports remain unchanged)

class SyncfusionCustomRadiusPieChart extends StatefulWidget {
  const SyncfusionCustomRadiusPieChart({Key? key}) : super(key: key);

  @override
  State<SyncfusionCustomRadiusPieChart> createState() => SyncfusionCustomRadiusPieChartState();
}

class SyncfusionCustomRadiusPieChartState extends State<SyncfusionCustomRadiusPieChart> {
  List<Color> chartColors = [
    const Color.fromRGBO(75, 135, 185, 1),
    const Color.fromRGBO(192, 108, 132, 1),
    const Color.fromRGBO(246, 114, 128, 1),
    const Color.fromRGBO(248, 177, 149, 1),
  ];
  int colorIndex = 0;
  int colorIndx = 0;
  List<String> percentages = ['0%', '95%', '85%', '77%', '55%'];
  int pIndex = 0;

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
          // Display SVG or any other widget when there is no data
          return Image.asset('assets/nodt.png'); // Replace YourSVGWidget with your actual SVG widget
        }

        // Process data and calculate totals for each category
        Map<String, double> categoryTotals = {};

        for (var doc in snapshot.data!.docs) {
          var category = doc['category'];
          var amount = doc['amount'];

          if (categoryTotals.containsKey(category)) {
            categoryTotals[category] = (categoryTotals[category]! + amount);
          } else {
            categoryTotals[category] = amount;
          }
        }

        // Sort the categories by total amount
        var sortedCategories = categoryTotals.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

        // Take all categories if there are fewer than four
        var topCategories = sortedCategories.take(4).toList();

        // Calculate the total for 'Others'
        var othersTotal = sortedCategories.sublist(4).fold(0, (prev, element) => (prev + element.value).toInt());

        // Create chart data
        List<ChartData> chartData = topCategories.map((entry) {
          pIndex++;
          return ChartData(entry.key, entry.value, percentages[pIndex]);
        }).toList();

        // Add 'Others' category
        chartData.add(ChartData('Others', othersTotal.toDouble(), '0%'));

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (MediaQuery.of(context).size.width > 600)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var category in topCategories)
                      SizedBox(
                        child: Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                color: chartColors[colorIndex % chartColors.length],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: BoldText(text: category.key),
                              ),
                            ]
                        ),
                      ),
                  ],
                ),
              ),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 1 / 4,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var category in topCategories)
                    Container(
                      height: 40,
                      width: 100,
                      color: chartColors[colorIndex % chartColors.length],
                      child: Column(
                        children: [
                          BoldText(text: category.key),
                          BoldText(text: '${category.value}')
                        ],
                      ),
                    ),
                ],
              ),
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



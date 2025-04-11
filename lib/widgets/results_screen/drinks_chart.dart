import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controllers/drinks_controller.dart';

class DrinksChart extends StatelessWidget {
  final drinksController = Get.find<DrinksController>();

  // Helper function to make the list for activities as ChartData for the donut chart
  arrayForDrinks() {
    List<ChartData> chartData = [];
    List colors = [Color.fromRGBO(186,1,200,1), Color.fromRGBO(1, 137, 200, 1),Color.fromRGBO(1, 200, 134, 1), Color.fromRGBO(8, 1, 200, 1)];
    int colorNum = 0;
    for (final drink in drinksController.drinks) {
      chartData.add(ChartData(drink.name, drink.amount, "${drink.amount}dl ${drink.name}", colors[colorNum]));
      colorNum += 1;
      //Check that colors are not gonna go out of index
      if (colorNum == colors.length) {
        colorNum = 0;
      }
    }
    return chartData;
  }


@override
Widget build(BuildContext context) {
        
        return Container(
                child: SfCircularChart(
                    series: <CircularSeries>[
                        // Renders doughnut chart
                        DoughnutSeries<ChartData, String>(
                            dataSource: arrayForDrinks(),
                            pointColorMapper:(ChartData data,  _) => data.color,
                            //pointColorMapper: (ChartSampleData data, _) => data.pointColor,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            dataLabelMapper: (ChartData data, _) => data.z,
                            dataLabelSettings: DataLabelSettings(
                                    // Renders the data label
                                    isVisible: true,
                                    labelPosition: ChartDataLabelPosition.outside
                                ),
                        
                        ),
                    ],
                    annotations: <CircularChartAnnotation>[
                          CircularChartAnnotation(
                            widget: Center(
                              child: Obx(() => Text(
                                'Total: ${drinksController.wholeAmount()} l',   // Your custom text
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(186,1,200,1),
                                ),
                              ),
                              ),
                            ),
                            // This annotation will be centered
                          )
                        ],
                )
            );
    }
}
  class ChartData {
      ChartData(this.x, this.y, this.z, this.color);
          final String x;
          final double y;
          final String z;
          final Color color;
  }
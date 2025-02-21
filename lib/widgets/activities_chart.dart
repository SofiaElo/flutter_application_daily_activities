import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



import '../controllers/activities_controller.dart';

class ActivitiesChart extends StatelessWidget {
  final activitiesController = Get.find<ActivitiesController>();

  // Helper function to make the list for activities as ChartData for the donut chart
  arrayForActivities() {
    List<ChartData> chartData = [];
    List colors = [Color.fromRGBO(186,1,200,1), Color.fromRGBO(1, 137, 200, 1),Color.fromRGBO(186,1,200,1),Color.fromRGBO(1, 200, 134, 1)];
    int colorNum = 0;
    for (final activity in activitiesController.activities) {
      chartData.add(ChartData(activity.name, activity.time, "${activity.time}h ${activity.name}", colors[colorNum]));
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
                            dataSource: arrayForActivities(),
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
                        
                        )
                    ]
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
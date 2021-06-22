import 'package:covid19_update/models/posts_model.dart';
import 'package:covid19_update/network/get_network.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'statistic_page.dart';

class BarChartSample3 extends StatefulWidget {
  // Future data;
  // BarChartSample3({this.data});
  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network();
    data = network.getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostsList>(
        future: data,
        builder: (context, AsyncSnapshot<PostsList> snapshots) {
          if (snapshots.hasData){
            var newData = snapshots.data;
            return AspectRatio(
              aspectRatio: 1.7,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                color: const Color(0xff2c4260),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 94228,
                    barTouchData: BarTouchData(
                      enabled: false,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.transparent,
                        tooltipPadding: const EdgeInsets.all(0),
                        tooltipMargin: 8,
                        getTooltipItem: (
                            BarChartGroupData group,
                            int groupIndex,
                            BarChartRodData rod,
                            int rodIndex,
                            ) {
                          return BarTooltipItem(
                            rod.y.round().toString(),
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(
                            color: Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                        margin: 20,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Cases';
                            case 1:
                              return 'Death';
                            case 2:
                              return 'Recovered';
                            case 3:
                              return 'Active';
                            case 4:
                              return 'Serious';
                            case 5:
                              return 'St';
                            case 6:
                              return 'Sn';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: SideTitles(showTitles: false),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(y: newData.postsList[96].cases.toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                        ],
                        showingTooltipIndicators: [0],
                      ),
                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(y: newData.postsList[96].deaths.toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                        ],
                        showingTooltipIndicators: [0],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(y: newData.postsList[96].recovered.toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                        ],
                        showingTooltipIndicators: [0],
                      ),
                      BarChartGroupData(
                        x: 3,
                        barRods: [
                          BarChartRodData(y: newData.postsList[96].active.toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                        ],
                        showingTooltipIndicators: [0],
                      ),
                      BarChartGroupData(
                        x: 4,
                        barRods: [
                          BarChartRodData(y: newData.postsList[96].critical.toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                        ],
                        showingTooltipIndicators: [0],
                      ),
                      // BarChartGroupData(
                      //   x: 5,
                      //   barRods: [
                      //     BarChartRodData(y: newData.postsList[96]..toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
                      //   ],
                      //   showingTooltipIndicators: [0],
                      // ),
                    ],
                  ),
                ),
              ),
            );;
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

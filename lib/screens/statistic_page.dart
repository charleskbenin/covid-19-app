import 'package:covid19_update/models/function.dart';
import 'package:covid19_update/models/posts_model.dart';
import 'package:covid19_update/network/get_network.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'bar_chart.dart';

class MyStatPage extends StatefulWidget {
  @override
  _MyStatPageState createState() => _MyStatPageState();
}

class _MyStatPageState extends State<MyStatPage> {
  Future data;


  @override
  void initState() {
    super.initState();
    Network network = Network();
    data = network.getData();
  }

  bool selectedItem = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          // height: 400,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xff473F98),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              myfavRow(
                context,
                firstWidget: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                secondWidget:
                    Icon(Icons.notifications_none, color: Colors.white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        'Statistics',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  Column(
                    children: [
                      Material(
                        elevation: 0.00,
                        color: Color(0xff6C65AC),
                        shape: StadiumBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: myNewButtons(() {
                                  setState(() {
                                    selectedItem = false;
                                  });
                                },
                                    'Ghana',
                                    selectedItem
                                        ? Color(0xff6C65AC)
                                        : Color(0xffFFFFFF)),
                              ),
                              Expanded(
                                  child: myNewButtons(() {
                                setState(() {
                                  selectedItem = true;
                                });
                              },
                                      'Global',
                                      selectedItem
                                          ? Color(0xffFFFFFF)
                                          : Color(0xff6C65AC)))
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Container(
                          height: 250,
                          child: ListView(
                        children: [
                          FutureBuilder<PostsList>(
                              future: data,
                              builder: (context,
                                  AsyncSnapshot<PostsList> snapshots) {
                                if (snapshots.hasData) {
                                  var newData = snapshots.data;
                                  return Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            myContainer(
                                                text: 'Cases',
                                                dataText: selectedItem
                                                    ? newData.postsList[0].cases
                                                        .toString()
                                                    : newData
                                                        .postsList[96].cases
                                                        .toString(),
                                                color: Color(0xffFFB259)),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                            myContainer(
                                                text: 'Death',
                                                dataText: selectedItem
                                                    ? newData
                                                        .postsList[0].deaths
                                                        .toString()
                                                    : newData
                                                        .postsList[96].deaths
                                                        .toString(),
                                                color: Color(0xffFF5959))
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height *0.020,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                myNewContainer(
                                                  context: context,
                                                    text: 'Recovered',
                                                    dataText: selectedItem
                                                        ? newData.postsList[0]
                                                            .recovered
                                                            .toString()
                                                        : newData.postsList[96]
                                                            .recovered
                                                            .toString(),
                                                    color: Color(0xff4CD97B)),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.04),
                                                // SizedBox(20),
                                                myNewContainer(
                                                  context: context,
                                                    text: 'Active',
                                                    dataText: selectedItem
                                                        ? newData
                                                            .postsList[0].active
                                                            .toString()
                                                        : newData.postsList[96]
                                                            .active
                                                            .toString(),
                                                    color: Color(0xff4DB5FF)),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.04),

                                                myNewContainer(
                                                  context: context,
                                                    text: 'Serious',
                                                    dataText: selectedItem
                                                        ? newData.postsList[0]
                                                            .critical
                                                            .toString()
                                                        : newData.postsList[96]
                                                            .critical
                                                            .toString(),
                                                    color: Color(0xff9059FF))
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),

                                  );
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                          // SizedBox(height: 10,)
                        ],
                      )),

                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            // decoration: BoxDecoration(
            //     color: Colors.grey.shade200,
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(40),
            //         topRight: Radius.circular(40))),
            height: MediaQuery.of(context).size.height *0.25,
            width: MediaQuery.of(context).size.width *40,
            child: BarChartSample3(),
          ),
        )
      ],
    ));
  }
}

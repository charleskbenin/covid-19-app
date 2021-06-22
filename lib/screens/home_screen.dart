import 'package:covid19_update/models/function.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'developer_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
            // height: 400,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Color(0xff473F98),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                myfavRow(context,
                    firstWidget: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    secondWidget:
                        Icon(Icons.notifications_none, color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                myfavRow(context,
                    firstWidget: Text(
                      'Covid-19',
                      style: TextStyle(color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                      ),
                    ),
                    // secondWidget: Text('Ghana', style: TextStyle(color: Colors.white),),
                    secondWidget: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      width: 200,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(imgUrl),
                        ),
                        title: Text('Ghana'),
                        trailing: Icon(Icons.arrow_drop_down),
                      ),
                    )),
                // SizedBox(
                //   // height: 20,
                // ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Are you feeling sick?',
                    style: TextStyle(color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                    ),
                  ),
                  
                  subtitle: Text(
                    'If you feel sick with any of covid symptoms\n please CALL or SMS us immediately for help.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mybuttons(context,
                        onpress: () {
                          actionButtons(call: "tel:0544544609");
                        },
                        iconData: Icons.call,
                        text: Text('Call Now', 
                        style: TextStyle(color: Colors.white),
                        ),
                        colors: Color(0xffFF4B58)),
                    mybuttons(context,
                        onpress: () {
                          actionButtons(call: "sms:0544544609");
                        },
                        iconData: Icons.sms,
                        text: Text('Send SMS', style: TextStyle(color: Colors.white),),
                        colors: Color(0xff4D79FF)),
                  ],
                ),
                // SizedBox(height: 10,),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height *0.30,
              margin: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Text('Prevention', style: TextStyle(fontWeight: FontWeight.bold),),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height *0.15,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: prevention.length,
                      itemBuilder: (context, index){
                        return Card(
                          elevation: 10,
                          child: Container(
                            // height: 100,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(prevention[index]['image'],
                                height: MediaQuery.of(context).size.height *0.10,
                                  width: MediaQuery.of(context).size.width *0.30,
                                ),
                                Text(prevention[index]['title'])
                              ],
                            ),
                          ),
                        );
                      }
                    ),

                  ),
                  // SizedBox(height: 10,),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          height: MediaQuery.of(context).size.height *0.20,
                          // width: 400,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height *0.20,
                          width: 400,
                        child: Row(
                            children: [
                              Container(
                                // margin: EdgeInsets.only(bottom: 70),
                                child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.width *0.15,
                                  backgroundImage: AssetImage('images/wash_hands.jpg',)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 30, top: 20),
                                margin: EdgeInsets.only(top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Do your own test!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                        'Follow the instructions to\n do your own test')
                                  ],
                                ),
                              )
                            ],
                          ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          ],
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
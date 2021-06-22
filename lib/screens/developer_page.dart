import 'package:covid19_update/models/function.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final _call = 'tel: 0544544609';
launchURL() async =>
    await canLaunch(_call) ? await launch(_call) : throw 'Could not launch $_call';

class Developer extends StatefulWidget {
  const Developer({Key key}) : super(key: key);

  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 300,
        padding: EdgeInsets.all(20),
        // margin: EdgeInsets.only(top: 100),
        child: Card(
          // color: Colors.red,
          elevation: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width *0.45,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              Expanded(
                child: Container(
                  // height: 300,
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Charles Benin',
                          style: TextStyle(color: Color(0xff4D79FF))),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text('Junior Software Developer',
                          style: TextStyle(color: Color(0xff4D79FF))),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text('Got a gig for me?',
                          style: TextStyle(color: Color(0xff4D79FF))),
                      SizedBox(
                        height: 10,
                      ),
                      myNewButtons(
                        () {
                          actionButtons(call: 'tel:0544544609');
                          // actionButtons(call: 'tel: 0544544609');
                        },
                        'Call',
                        Color(0xff4D79FF),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


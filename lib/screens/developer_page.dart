import 'package:covid19_update/models/function.dart';
import 'package:flutter/material.dart';

class Developer extends StatefulWidget {
  const Developer({Key key}) : super(key: key);

  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(top: 100),
        child: Card(
          elevation: 50,
          child: Column(
            children: [
              CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('images/wash_hands.jpg'),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('Charles Benin',
                        style: TextStyle(color: Color(0xff4D79FF))),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Junior Software Developer',
                        style: TextStyle(color: Color(0xff4D79FF))),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Got a gig for me?',
                        style: TextStyle(color: Color(0xff4D79FF))),
                    SizedBox(
                      height: 40,
                    ),
                    myNewButtons(
                      () {},
                      'Call',
                      Color(0xff4D79FF),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

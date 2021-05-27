import 'package:covid19_update/models/posts_model.dart';
import 'package:covid19_update/network/get_network.dart';
import 'package:flutter/material.dart';

import 'models/function.dart';
import 'screens/home_screen.dart';
import 'screens/navBar.dart';

final imgUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCF8OUl-9Lx_pqEErnvTYbKp_qjXNusgWnDA&usqp=CAU";
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 Update',
      home: 
      NavBar()
      // HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future data;
  @override
  void initState() {
    super.initState();

    Network network = Network();
    data = network.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<PostsList>(
            future: data,
            builder: (context, AsyncSnapshot<PostsList> snapshots) {
              if (snapshots.hasData)
                return SingleChildScrollView(
                  child: Center()
                );
              else {
                return Center(
                    // child: CircularProgressIndicator(),
                    );
              }
            }));
  }
}

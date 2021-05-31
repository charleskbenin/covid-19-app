import 'package:covid19_update/models/posts_model.dart';
import 'package:covid19_update/network/get_network.dart';
import 'package:flutter/material.dart';
class AllCountry extends StatefulWidget {
  const AllCountry({Key key}) : super(key: key);

  @override
  _AllCountryState createState() => _AllCountryState();
}

class _AllCountryState extends State<AllCountry> {
  Future data;

  @override
  void initState() {
    super.initState();
    Network network = Network();
    data = network.getData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<PostsList>(
        future: data,
        builder: (context, AsyncSnapshot<PostsList> snapshots) {
          if (snapshots.hasData) {
            // var newData = snapshots.data.postsList[index];
            return ListView.builder(
              itemCount: snapshots.data.postsList.length,
                itemBuilder: (context, index){
                  var newData = snapshots.data.postsList[index];
                  return Container(
                      child: Card(
                        child: ListTile(
                          title: Text(newData.country),
                          subtitle: Text('Cases: ${newData.cases.toString()}'),
                        ),
                      ),
                  );
                }
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}

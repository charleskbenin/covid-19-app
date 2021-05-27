import 'package:covid19_update/models/posts_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Network {
  
  String url = "https://coronavirus-19-api.herokuapp.com/countries";

  Future <PostsList> getData() async{
    final response = await http.get(Uri.parse(url));
    print("Got it");

    if (response.statusCode == 200) {
      print(response.body);

      var data = json.decode(response.body);
      return PostsList.fromjson(data);
    }else{
      Exception("Can't locate the $url");
    }
  }
}
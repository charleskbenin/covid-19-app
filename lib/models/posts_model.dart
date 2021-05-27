// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

// String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.totalTests,
    this.testsPerOneMillion,
  });

  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int totalTests;
  int testsPerOneMillion;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        country: json["country"],
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"],
        totalTests: json["totalTests"],
        testsPerOneMillion: json["testsPerOneMillion"],
      );

  // Map<String, dynamic> toJson() => {
  //       "country": country,
  //       "cases": cases,
  //       "todayCases": todayCases,
  //       "deaths": deaths,
  //       "todayDeaths": todayDeaths,
  //       "recovered": recovered,
  //       "active": active,
  //       "critical": critical,
  //       "casesPerOneMillion": casesPerOneMillion,
  //       "deathsPerOneMillion": deathsPerOneMillion,
  //       "totalTests": totalTests,
  //       "testsPerOneMillion": testsPerOneMillion,
  //     };
}

class PostsList {
  List<Posts> postsList;
  PostsList({this.postsList});

  factory PostsList.fromjson(List parsedjson){
    List<Posts> posterList = <Posts>[];
    posterList = parsedjson.map((e) => Posts.fromJson(e)).toList();

    return PostsList(postsList: posterList);
  }
}
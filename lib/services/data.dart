import 'package:flutter/material.dart';

class Data {
  String status;
  int totalResults;
  List<dynamic> articles;

  Data(
      {@required this.status,
      @required this.totalResults,
      @required this.articles});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: json['articles'],
    );
  }
}

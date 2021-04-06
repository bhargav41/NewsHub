import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:news_hub/services/data.dart';

import '../constants.dart';
import 'dart:developer' as developer;

Future<Data> getData() async {
  var uri = Uri.https(api, "/v2/top-headlines",
      {"country": "in", "apiKey": "b2014968696348f6afa6333cb8eaa84d"});
  http.Response response = await http.get(uri);
  print(uri);

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);

    return Data.fromJson(jsonResponse);
  } else
    throw Exception(response.statusCode);
}

Future<Data> getDatabyId(String title) async {
  var uri = Uri.https(api, "/v2/top-headlines",
      {"sources": "techcrunch", "apiKey": "b2014968696348f6afa6333cb8eaa84d"});
  http.Response response = await http.get(uri);
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);

    return Data.fromJson(jsonResponse);
  } else
    throw Exception(response.statusCode);
}

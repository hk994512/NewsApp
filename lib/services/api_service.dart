import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Services {
  Future<List<dynamic>> newsProvider() async {
    var uri =
        'https://newsdata.io/api/1/sources?country=pk&apikey=pub_59090b3222f4e258a5bd0d2297a112bc43caa';
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      debugPrint(response.body.toString());
      return json.decode(response.body)['results'];
    } else {
      throw Exception("Could not fetch Data");
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:newstoday/Model/model.dart';

class NewsApi {
  List<Newmsodel> datastore = [];
  Future<void> getnews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2c0b61fdd2d34b3e9a8698e31ff1224f");
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if (jsondata['status'] == 'ok') {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["author"] != null &&
            element["content"] != null) {
          Newmsodel newmsodel = Newmsodel(
              title: element['title'],
              urlimage: element["urlToImage"],
              author: element["author"],
              content: element["content"],
              description: element["description"]);
          datastore.add(newmsodel);
        }
      });
    }
  }
}

class Newscategory {
  List<Newmsodel> datastore = [];
  Future<void> getnews(String category) async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=2c0b61fdd2d34b3e9a8698e31ff1224f");
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    if (jsondata['status'] == 'ok') {
      jsondata["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["author"] != null &&
            element["content"] != null) {
          Newmsodel newmsodel = Newmsodel(
              title: element['title'],
              urlimage: element["urlToImage"],
              author: element["author"],
              content: element["content"],
              description: element["description"]);
          datastore.add(newmsodel);
        }
      });
    }
  }
}

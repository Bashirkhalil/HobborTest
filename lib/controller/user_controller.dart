

























































import 'dart:convert';

import '../model/user_article.dart';
import 'package:http/http.dart' as http;

class NewController {

  var baseURl  = "https://emergingideas.ae/test_apis";

  Future<List<User>> fetchNews() async {
    var url = "/read.php?email=mikehsch@email.com";
    final response = await http.get(Uri.parse(baseURl+url));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['articles'];
      return jsonData.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }


}
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../common/constant.dart';
import '../common/response.dart';
import '../model/user_article.dart';

class UserController {

  fetchNews(String email) async {
    var url = "/read.php?email=$email";

    final response = await http.get(Uri.parse(mBaseURl + url));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  deleteUser(User user) async {
    var url = "/delete.php?email=${user.email}&id=${user.id}";
    final response = await http.delete(Uri.parse(mBaseURl + url));
    if (response.statusCode == 200) {
      var mResponse  =  json.decode(response.body)[0]["message"];
      return mResponse ;
    } else {
      throw Exception('Failed to load news');
    }
  }

  updateUser(User user) async {
    var url =
        "/edit.php?email=${user.email}&id=${user.id}&description=${user.description}&title=${user.title}&img_link=${user.img_link}";
    final response = await http.patch(Uri.parse(mBaseURl + url));
    if (response.statusCode == 200) {
      var mResponse  =  json.decode(response.body)[0]["message"];
      return mResponse ;
    } else {
      throw Exception('Failed to load news');
    }
  }

  newUser(User user) async {
    const String url = "/create.php";

    final response = await http.post(
      Uri.parse(mBaseURl + url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'description': user.description,
        'title': user.title,
        'img_link': user.img_link,
        // Add any other data you want to send in the body
      }),
    );

    if (response.statusCode == 200) {
      var mResponse  =  json.decode(response.body)[0]["message"];
      return mResponse ;
    } else {
      print("Exception");
      throw Exception('Failed to load news');
    }

  }
}

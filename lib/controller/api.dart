import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<bool> postData() async {
    var url = 'https://reqres.in/api/register';
    Map<String, dynamic> data = {
      "email": "eve.holt@reqres.in",
      "password": "pistol"
    };
    var body = jsonEncode(data);
    var responce = await http.post(Uri.parse(url), body: body);
    if (responce.statusCode == 200) {
      print('Success');
      return true;
    } else {
      print('faild');

      return false;
    }
  }
}

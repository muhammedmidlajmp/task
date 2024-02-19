// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends ChangeNotifier {
  bool status = false;
  Future<void> postData() async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      var request =
          http.Request('POST', Uri.parse('https://reqres.in/api/register'));
      request.bodyFields = {
        'email': 'eve.holt@reqres.in',
        'password': 'pistol'
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print('Success');
        status = true;
        notifyListeners();
      } else {
        print('Failed with status code: ${response.statusCode}');
        status = false;
        notifyListeners();
      }
    } catch (error) {
      // Handle specific exceptions or log the error message
      print('Error: $error');
      status = false;
    }
  }
}

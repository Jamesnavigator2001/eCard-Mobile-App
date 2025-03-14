import 'dart:convert';

import 'package:ecard_app/client/root_url.dart';
import 'package:http/http.dart' as http;

class AuthRequests{
  static Future<http.Response> login(String path, Object object) async{
    var response = await  http.post(
      Uri.parse("${BaseUrl.baseEndPoint}/auth/$path"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(object)
    );
    return response;
  }
}
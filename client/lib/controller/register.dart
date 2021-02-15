import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:client/url.dart';

Future<dynamic> registera(username, fullname, password, email) async {
  final response = await http.post(
    'https://$url/user/register',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'username': username,
      "fullname": fullname,
      'password': password,
    }),
  );
  var body = jsonDecode(response.body);

  if (body["StatusCode"] == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return true;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return false;
  }
}

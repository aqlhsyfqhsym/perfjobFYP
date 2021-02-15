import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:client/url.dart';

Future<dynamic> dec(password) async {
  final response = await http.post(
    'https://$url/helper/decryptpass',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'password': password,
    }),
  );
  var body = jsonDecode(response.body);

  if (body["password"] != "") {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return body["password"];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return "";
  }
}

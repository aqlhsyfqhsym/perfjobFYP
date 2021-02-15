import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:client/model/user.dart';
import 'package:client/url.dart';

Future<dynamic> editprofile(User user) async {
  final response = await http.put(
    'https://$url/user/editaccount',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "username": user.user[0].username,
      "password": user.user[0].password,
      "email": user.user[0].email,
      "fullname": user.user[0].fullname,
      "id": user.user[0].id,
      "photo": user.user[0].photo,
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

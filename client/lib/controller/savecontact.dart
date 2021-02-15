import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:client/url.dart';

Future<dynamic> savecontact(userid, contact, templete) async {
  final response = await http.post(
    'https://$url/resume/addcontactinformation',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "userid": userid,
      "contactinformation": contact,
    }),
  );
  var body = jsonDecode(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return true;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return false;
  }
}

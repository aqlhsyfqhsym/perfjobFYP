import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:client/url.dart';

Future<dynamic> saverusme(userid, Set set,
    {skills, education, workingexperience, contactinformation}) async {
  final response = await http.post(
    'https://$url/resume/addresume',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "userid": userid,
      "skills": skills,
      "education": education,
      "working_experience": workingexperience,
      "contactinformation": contactinformation
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

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:client/controller/getreusmeall.dart';
import 'package:client/model/resume.dart';
import 'package:client/view/contact.dart';
import 'package:client/view/creerusme.dart';
import 'package:client/view/displayjob.dart';
import 'package:client/view/editprofile.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:client/view/homepage.dart';
import 'package:client/view/login.dart';
import 'package:client/view/prevew.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ResumePage extends StatefulHookWidget {
  final user;
  final resume;

  final templete;
  ResumePage({this.user, this.templete, this.resume});

  @override
  _ResumePageState createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  Image image;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Uint8List _image = base64Decode(widget.user.user[0].photo);
  //   image = Image.memory(
  //     _image,
  //     width: 50,
  //     height: 50,
  //     fit: BoxFit.cover,
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    var name = useState(widget.user);
    print(widget.templete);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              margin: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 1.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: Offset(1, -1) // // changes position of shadow
                      ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.user.user[0].photo == null
                          ? CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: Icon(
                                Icons.add,
                                size: 50,
                                color: Colors.grey,
                              ),
                              radius: 30.0,
                            )
                          : ClipOval(
                              child: Image.memory(
                                base64Decode(widget.user.user[0].photo),
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, " + widget.user.user[0].fullname,
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              fontFamily: 'NerkoOne'),
                        ),
                        Text(
                          widget.user.user[0].username.toString(),
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 20.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  // alignment: Alignment.bottomCenter,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditProfile(
                                                  user1: widget.user,
                                                )),
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                            color: Colors.grey[100])),
                                    child: const Text('Edit Profile',
                                        style: TextStyle(fontSize: 10)),
                                    color: Colors.grey[100],
                                    textColor: Colors.black,
                                    elevation: 5,
                                  ),
                                ),
                                // Align(
                                //   // alignment: Alignment.centerRight
                                //   child: RaisedButton(
                                //     onPressed: () {
                                //       Navigator.pushAndRemoveUntil(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   Loginpage()),
                                //           (Route<dynamic> route) => false);
                                //     },
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(5),
                                //         side: BorderSide(
                                //             color: Colors.grey[100])),
                                //     child: const Text('Logout',
                                //         style: TextStyle(fontSize: 10)),
                                //     color: Colors.grey[100],
                                //     textColor: Colors.black,
                                //     elevation: 5,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 2,
                left: 18.0,
                right: 18,
                bottom: 8,
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 1.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset: Offset(1, -1) // changes position of shadow
                        ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactInfopage(
                                templete: widget.templete,
                                user: name.value,
                              )),
                    );
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Icon(
                            Icons.supervised_user_circle_rounded,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Text(
                            "Backgroud Profile",
                            style: TextStyle(
                              letterSpacing: 2.0,
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactInfopage(
                                  templete: widget.templete,
                                  user: name.value,
                                )),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset:
                                  Offset(1, -1), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 100,
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Icon(
                                  Icons.call,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Container(
                                child: Text(
                                  "Contact\nInformation",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Creerusme(
                                templete: widget.templete,
                                user: name.value,
                                skills: false,
                                we: false,
                                lg: false,
                                ed: true,
                                ar: false)),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset:
                                  Offset(1, -1), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 100,
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Icon(
                                  Icons.library_books,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Container(
                                child: Text(
                                  "Education",
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          Expanded(
            flex: 1,
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Creerusme(
                                templete: widget.templete,
                                user: name.value,
                                skills: false,
                                lg: false,
                                we: true,
                                ed: false,
                                ar: false)),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset:
                                  Offset(1, -1), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 100,
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Icon(
                                  Icons.work,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Container(
                                child: Text(
                                  "Work\nExperience",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Creerusme(
                                templete: widget.templete,
                                user: name.value,
                                skills: true,
                                we: false,
                                lg: false,
                                ed: false,
                                ar: false)),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset:
                                  Offset(1, -1), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 100,
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Icon(
                                  Icons.list,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Container(
                                child: Text(
                                  "Skills",
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          Expanded(
            flex: 1,
            child: Row(children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Creerusme(
                                templete: widget.templete,
                                user: name.value,
                                skills: false,
                                we: false,
                                lg: false,
                                ed: false,
                                ar: true)),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset:
                                  Offset(1, -1), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 100,
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Icon(
                                  Icons.cast_for_education,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Container(
                                child: Text(
                                  "Award\nAchievement",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Creerusme(
                                templete: widget.templete,
                                user: name.value,
                                skills: false,
                                we: false,
                                ed: false,
                                ar: false,
                                lg: true)),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset:
                                  Offset(1, -1), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 100,
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Icon(
                                  Icons.chat_bubble_outline_rounded,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: Container(
                                child: Text(
                                  "Language",
                                  style: TextStyle(
                                    letterSpacing: 2.0,
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 2,
                left: 18.0,
                right: 18,
                bottom: 8,
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 1.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset: Offset(1, -1) // changes position of shadow
                        ),
                  ],
                ),
                child: FlatButton(
                  onPressed: () async {
                    //
                    var daresta = await getreusme(name.value.user[0].id);
                    var resume = Resume.fromJson(jsonDecode(daresta));
                    Directory appDocDir =
                        await getApplicationDocumentsDirectory();
                    String appDocPath = appDocDir.path;
                    final file = File(appDocPath + "/data.pdf");
                    var ftemplete = await generateResume(
                        PdfPageFormat.a4, widget.user, resume);
                    var templete = await file.writeAsBytes(ftemplete);
                    OpenFile.open(file.path);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Icon(
                            Icons.file_download,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Text(
                            "Preview your resume",
                            style: TextStyle(
                              letterSpacing: 2.0,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 2,
                left: 18.0,
                right: 18,
                bottom: 8,
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 1.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 5,
                        offset: Offset(1, -1) // changes position of shadow
                        ),
                  ],
                ),
                child: FlatButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Displayjob(
                                template: widget.templete,
                                user: widget.user,
                              )),
                    );
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Icon(
                            Icons.find_in_page,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Text(
                            "Find Job",
                            style: TextStyle(
                              letterSpacing: 2.0,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Container(
                      child: Align(
                        heightFactor: 50,
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homepage(
                                            user: name.value,
                                          )),
                                  (Route<dynamic> route) => false);
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Colors.black45,
                                    size: 25,
                                  ),
                                  Text("HOME",
                                      style: TextStyle(
                                        fontFamily: 'NerkoOne',
                                        letterSpacing: 4.0,
                                        fontSize: 15,
                                        color: Colors.black45,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Container(
                      child: Align(
                        heightFactor: 50,
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.clear();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loginpage()),
                                  (Route<dynamic> route) => false);
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.black45,
                                    size: 25,
                                  ),
                                  Text("LOG OUT",
                                      style: TextStyle(
                                        fontFamily: 'NerkoOne',
                                        letterSpacing: 4.0,
                                        fontSize: 15,
                                        color: Colors.black45,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

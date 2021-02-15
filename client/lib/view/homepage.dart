import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:client/model/user.dart';
import 'package:client/view/editprofile.dart';
import 'package:client/view/login.dart';
import 'package:client/view/rsumepage.dart';
import 'package:client/view/editresmue.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  final User user;
  final templete;

  Homepage({this.user, this.templete});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Image image;

  // @override
  // void initState() {
  //   // // TODO: implement initState
  //   // Uint8List _image = base64Decode(snapshot.data.user.user[0].photo);
  //   // image = Image.memory(
  //   //   _image,
  //   //   width: 50,
  //   //   height: 50,
  //   //   fit: BoxFit.cover,
  //   // );

  //   super.initState();
  // }

  Future<User> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    // ignore: unused_local_variable

    return User.fromJson(jsonDecode(prefs.getString(key)));
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: FutureBuilder(
          future: read("user"),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return Column(
                    children: [
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
                                  offset: Offset(
                                      1, -1) // // changes position of shadow
                                  ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: snapshot.data.user[0].photo == null
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
                                            base64Decode(
                                                snapshot.data.user[0].photo),
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
                                      "Hello, " +
                                          snapshot.data.user[0].fullname,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20,
                                          fontFamily: 'NerkoOne'),
                                    ),
                                    Text(
                                      snapshot.data.user[0].username.toString(),
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 20.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              // alignment: Alignment.bottomCenter,
                                              child: RaisedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditProfile(
                                                              user1:
                                                                  snapshot.data,
                                                            )),
                                                  );
                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    side: BorderSide(
                                                        color:
                                                            Colors.grey[100])),
                                                child: const Text(
                                                    'Edit Profile',
                                                    style: TextStyle(
                                                        fontSize: 10)),
                                                color: Colors.white,
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
                                            //         borderRadius:
                                            //             BorderRadius.circular(5),
                                            //         side: BorderSide(
                                            //             color: Colors.grey[100])),
                                            //     child: const Text('Logout',
                                            //         style: TextStyle(fontSize: 10)),
                                            //     color: Colors.white,
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
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 18.0,
                            right: 18,
                            bottom: 8,
                          ),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 1.0),
                            height: double.infinity,
                            width: double.infinity,
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
                                  offset: Offset(
                                      1, -1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.file_copy,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "New Resume",
                                            style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ResumePage(
                                                              templete: "1",
                                                              user:
                                                                  snapshot.data,
                                                            )),
                                                  );
                                                },
                                                child: Card(
                                                  elevation: 5,
                                                  margin: EdgeInsets.fromLTRB(
                                                      0.0, 0.0, 0.0, 16.0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.3),
                                                          spreadRadius: 0.5,
                                                          blurRadius: 5,
                                                          offset: Offset(1,
                                                              -1), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    width: 100,
                                                    height: 100,
                                                    child: Center(
                                                      child: Text(
                                                        " BEAT ATS \n  TEMPLATE",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Expanded(
                                          //   flex: 1,
                                          //   child: Padding(
                                          //     padding:
                                          //         const EdgeInsets.all(8.0),
                                          //     child: InkWell(
                                          //       onTap: () {
                                          //         Navigator.push(
                                          //           context,
                                          //           MaterialPageRoute(
                                          //               builder: (context) =>
                                          //                   ResumePage(
                                          //                     templete: "2",
                                          //                     user:
                                          //                         snapshot.data,
                                          //                   )),
                                          //         );
                                          //       },
                                          //       child: Card(
                                          //         elevation: 5,
                                          //         margin: EdgeInsets.fromLTRB(
                                          //             0.0, 0.0, 0.0, 16.0),
                                          //         shape: RoundedRectangleBorder(
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   8.0),
                                          //         ),
                                          //         child: Container(
                                          //           decoration: BoxDecoration(
                                          //             color: Colors.white,
                                          //             borderRadius:
                                          //                 BorderRadius.only(
                                          //                     topLeft: Radius
                                          //                         .circular(10),
                                          //                     topRight: Radius
                                          //                         .circular(10),
                                          //                     bottomLeft: Radius
                                          //                         .circular(10),
                                          //                     bottomRight:
                                          //                         Radius
                                          //                             .circular(
                                          //                                 10)),
                                          //             boxShadow: [
                                          //               BoxShadow(
                                          //                 color: Colors.grey
                                          //                     .withOpacity(0.3),
                                          //                 spreadRadius: 0.5,
                                          //                 blurRadius: 5,
                                          //                 offset: Offset(1,
                                          //                     -1), // changes position of shadow
                                          //               ),
                                          //             ],
                                          //           ),
                                          //           width: 100,
                                          //           height: 100,
                                          //           child: Center(
                                          //             child: Text(
                                          //               " NORMAL \n  TEMPLATE",
                                          //               textAlign:
                                          //                   TextAlign.center,
                                          //               style: TextStyle(
                                          //                 fontSize: 11,
                                          //                 color:
                                          //                     Colors.grey[200],
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // Expanded(
                                          //   flex: 1,
                                          //   child: Padding(
                                          //     padding: const EdgeInsets.all(8.0),
                                          //     child: InkWell(
                                          //       onTap: () {
                                          //         Navigator.push(
                                          //           context,
                                          //           MaterialPageRoute(
                                          //               builder: (context) =>
                                          //                   ResumePage(
                                          //                     templete: "3",
                                          //                     user: snapshot.data.user,
                                          //                   )),
                                          //         );
                                          //       },
                                          //       child: Card(
                                          //         elevation: 5,
                                          //         margin: EdgeInsets.fromLTRB(
                                          //             0.0, 0.0, 0.0, 16.0),
                                          //         shape: RoundedRectangleBorder(
                                          //           borderRadius:
                                          //               BorderRadius.circular(8.0),
                                          //         ),
                                          //         child: Container(
                                          //           decoration: BoxDecoration(
                                          //             color: Colors.white,
                                          //             borderRadius: BorderRadius.only(
                                          //                 topLeft: Radius.circular(10),
                                          //                 topRight: Radius.circular(10),
                                          //                 bottomLeft:
                                          //                     Radius.circular(10),
                                          //                 bottomRight:
                                          //                     Radius.circular(10)),
                                          //             boxShadow: [
                                          //               BoxShadow(
                                          //                 color: Colors.grey
                                          //                     .withOpacity(0.5),
                                          //                 offset: Offset(1,
                                          //                     -1), // changes position of shadow
                                          //               ),
                                          //             ],
                                          //           ),
                                          //           width: 100,
                                          //           height: 100,
                                          //           child: Center(
                                          //             child: Text(
                                          //               "TEMPLATE 3",
                                          //               style: TextStyle(
                                          //                 fontSize: 11,
                                          //                 color: Colors.grey,
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  )
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
                                    offset: Offset(
                                        1, -1) // changes position of shadow
                                    ),
                              ],
                            ),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Editresume(
                                              user: snapshot.data,
                                            )));
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Icon(
                                        Icons.file_present,
                                        color: Colors.grey,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Text(
                                        "EDIT EXISTING RESUME",
                                        style: TextStyle(
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 1.0),
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
                                    offset: Offset(
                                        1, -1) // changes position of shadow
                                    ),
                              ],
                            ),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ResumePage(user: widget.user)),
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Icon(
                                        Icons.preview_rounded,
                                        color: Colors.grey,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Text(
                                        "PREVIEW YOUR RESUME",
                                        style: TextStyle(
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
                  );
            }
          }),
    ));
  }
}

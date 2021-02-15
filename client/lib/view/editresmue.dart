import 'package:flutter/material.dart';
import 'package:client/model/user.dart';
import 'package:client/controller/editpart.dart';
import 'package:client/view/rsumepage.dart';

class Editresume extends StatefulWidget {
  final User user;
  Editresume({this.user});
  @override
  _EditresumeState createState() => _EditresumeState();
}

class _EditresumeState extends State<Editresume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("WARNING"),
                            content: new Text(
                                "This resume will be delete to give some space for new one."),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              FlatButton(
                                child: new Text("Ok"),
                                onPressed: () async {
                                  // Close the dialog
                                  var test = await editreusme(
                                      widget.user.user[0].id, "template 1");
                                  if (test == true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ResumePage(
                                                templete: "1",
                                                user: widget.user,
                                              )),
                                    );
                                  }
                                },
                              ),
                              FlatButton(
                                child: new Text("No"),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
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
                        child: Center(
                          child: Text(
                            "BEAT ATS\n TEMPLATE",
                            textAlign: TextAlign.center,
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
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("WARNING"),
                            content: new Text(
                                "This resume will be delete to give some space for new one."),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              FlatButton(
                                child: new Text("Ok"),
                                onPressed: () async {
                                  // Close the dialog
                                  var test = await editreusme(
                                      widget.user.user[0].id, "template 2");
                                  if (test == true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ResumePage(
                                                templete: "2",
                                                user: widget.user,
                                              )),
                                    );
                                  }
                                },
                              ),
                              FlatButton(
                                child: new Text("No"),
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    // child: Card(
                    //   elevation: 5,
                    //   margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(8.0),
                    //   ),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(10),
                    //           topRight: Radius.circular(10),
                    //           bottomLeft: Radius.circular(10),
                    //           bottomRight: Radius.circular(10)),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.5),
                    //           offset:
                    //               Offset(1, -1), // changes position of shadow
                    //         ),
                    //       ],
                    //     ),
                    //     width: 100,
                    //     height: 100,
                    //     child: Center(
                    //       child: Text(
                    //         "NORMAL \TEMPLATE",
                    //         style: TextStyle(
                    //           fontSize: 11,
                    //           color: Colors.grey[100],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

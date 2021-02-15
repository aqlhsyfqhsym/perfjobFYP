import 'package:flutter/material.dart';
import 'package:client/controller/savecontact.dart';

import 'package:client/model/user.dart';
import 'package:client/view/creerusme.dart';

class ContactInfopage extends StatefulWidget {
  final User user;

  final templete;
  ContactInfopage({this.user, this.templete});
  @override
  _ContactInfopageState createState() => _ContactInfopageState();
}

class _ContactInfopageState extends State<ContactInfopage> {
  var ct = true;
  final _formKeyeduction = GlobalKey<FormState>();

  final summ = TextEditingController();
  final name = TextEditingController();
  final addr = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final gend = TextEditingController();

  // var skillsarr = [];
  // var workarr = [];
  var contactarr = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final maxLines = 5;

    print(widget.templete);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(
          child: Text(
            " Background Profile \n& Contact Information",
            style: TextStyle(
              fontFamily: 'NerkoOne',
              letterSpacing: 2.0,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.save, color: Colors.black),
            onPressed: () async {
              if (_formKeyeduction.currentState.validate()) {
                contactarr = [];
                contactarr.add(
                  {
                    "summary": summ.text,
                    "fullname": name.text,
                    "address": addr.text,
                    "email": email.text,
                    "phone": phone.text,
                    "gender": gend.text,
                  },
                );
                var test = await savecontact(
                    widget.user.user[0].id, contactarr, widget.templete);

                if (test) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Creerusme(
                              templete: "1",
                              user: widget.user,
                              skills: false,
                              we: false,
                              ed: true,
                              ar: false,
                              lg: false,
                            )),
                  );
                } else {
                  final snackBar = SnackBar(
                      content: Text("You are ready now, click continue!"));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
                  _scaffoldKey.currentState..showSnackBar(snackBar);
                }

                print(contactarr);
              }
            },
          ),
        ],
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKeyeduction,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5.0, 0.0, 20.0, 1.0),
                        child: Text(
                          " \n Personal Details \n ",
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 10, left: 10, top: 0, bottom: 2),
                                height: maxLines * 24.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  style: TextStyle(fontSize: 12),
                                  maxLines: maxLines,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: summ,
                                  cursorColor: Colors.black,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Professional Summary',
                                    labelStyle: TextStyle(fontSize: 16),
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 10, left: 10, top: 0, bottom: 2),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  style: TextStyle(fontSize: 12),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: name,
                                  cursorColor: Colors.black,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Fullname',
                                    labelStyle: TextStyle(fontSize: 16),
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 10, left: 10, top: 0, bottom: 2),
                                height: maxLines * 16.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  style: TextStyle(fontSize: 12),
                                  maxLines: maxLines,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: addr,
                                  cursorColor: Colors.black,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Address',
                                    labelStyle: TextStyle(fontSize: 16),
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 10, left: 10, top: 0, bottom: 2),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  style: TextStyle(fontSize: 12),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: email,
                                  cursorColor: Colors.black,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'E-mail',
                                    labelStyle: TextStyle(fontSize: 16),
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 10, left: 10, top: 0, bottom: 2),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  style: TextStyle(fontSize: 12),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: phone,
                                  cursorColor: Colors.black,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Phone Number',
                                    labelStyle: TextStyle(fontSize: 16),
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 10, left: 10, top: 0, bottom: 2),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  style: TextStyle(fontSize: 12),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: gend,
                                  cursorColor: Colors.black,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Gender',
                                    labelStyle: TextStyle(fontSize: 16),
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 11,
                                        top: 11,
                                        right: 15),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Creerusme(
                                          templete: "1",
                                          user: widget.user,
                                          skills: false,
                                          we: false,
                                          ed: true,
                                          ar: false,
                                          lg: false,
                                        )),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.double_arrow_rounded,
                                    color: Colors.black45,
                                    size: 25,
                                  ),
                                  Text("CONTINUE",
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
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_collapse/flutter_collapse.dart';
import 'package:client/controller/saveaward.dart';
import 'package:client/controller/saveeduction.dart';
import 'package:client/controller/savelang.dart';
import 'package:client/controller/saveskills.dart';
import 'package:client/controller/savewe.dart';
import 'package:client/model/user.dart';
import 'package:client/view/displayjob.dart';

import 'package:client/view/homepage.dart';
import 'package:client/view/login.dart';
import 'package:client/view/rsumepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Creerusme extends StatefulWidget {
  final User user;
  final templete;
  final bool skills;
  final bool we;
  final bool ed;
  final bool ar;
  final bool lg;

  Creerusme(
      {this.user,
      this.skills,
      this.we,
      this.ed,
      this.ar,
      this.lg,
      this.templete});
  @override
  _CreerusmeState createState() => _CreerusmeState();
}

class _CreerusmeState extends State<Creerusme> {
  final _formKeyeduction = GlobalKey<FormState>();
  final _formKeyskills = GlobalKey<FormState>();
  final _formKeylg = GlobalKey<FormState>();
  final _formKeyar = GlobalKey<FormState>();

  List<bool> status = [];
  List<bool> status1 = [];
  List<bool> status2 = [];
  final _formKeyworkex = GlobalKey<FormState>();
  var i = 0;
  var k = 0;
  var u = 0;
  var l = 0;
  var arindex = 0;
  final sk = [
    TextEditingController(),
  ];
  final List<Widget> skelemnt = [];
  final List<Widget> aducctionelemnt = [];
  final List<Widget> workelemnt = [];
  final List<Widget> lgelemnt = [];
  final List<Widget> awrelemnt = [];
  final ar = [];
  final ar1 = [];

  final lgc = TextEditingController();

  final lycee = [];
  final yeareduction = [];
  final note = [];

  final company = [];
  final postion = [];
  final yearcompany = [];

  final lgn = [];

  var skillsarr = [];
  var awarr = [];
  var lgarr = [];
  var workarr = [];
  var eductionarr = [];
  var skills;
  var we;
  var ed;
  var art;
  var lg;
  var disable = false;
  @override
  void initState() {
    skills = widget.skills;
    we = widget.we;
    ed = widget.ed;
    art = widget.ar;
    lg = widget.lg;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxLines = 5;

    if (ed) {
      //EDUCATION
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: disable == true
                  ? null
                  : () {
                      var y = i;
                      if (i < 5) {
                        status.add(true);
                        yeareduction.add(TextEditingController());
                        note.add(TextEditingController());
                        lycee.add(TextEditingController());

                        aducctionelemnt.add(Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Collapse(
                            title: Container(
                              child: Text(
                                'Education \nIf relevant, include your most recent educational and the dates here. \n (Eg : 2016-2019 University Of Nottingham \n Diploma in Business Law)',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            body: Container(
                              height: 400,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10,
                                                  left: 10,
                                                  top: 0,
                                                  bottom: 2),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: TextFormField(
                                                style: TextStyle(fontSize: 12),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please enter some text';
                                                  }
                                                  return null;
                                                },
                                                controller: lycee[y],
                                                cursorColor: Colors.black,
                                                decoration: new InputDecoration(
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  labelText: 'School',
                                                  labelStyle:
                                                      TextStyle(fontSize: 14),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.only(
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
                                                  right: 10,
                                                  left: 10,
                                                  top: 0,
                                                  bottom: 2),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: TextFormField(
                                                style: TextStyle(fontSize: 12),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please enter some text';
                                                  }
                                                  return null;
                                                },
                                                controller: yeareduction[y],
                                                cursorColor: Colors.black,
                                                decoration: new InputDecoration(
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  labelText: 'Year',
                                                  labelStyle:
                                                      TextStyle(fontSize: 14),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.only(
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
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 10,
                                          left: 10,
                                          top: 0,
                                          bottom: 200),
                                      height: maxLines * 24.0,
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
                                        controller: note[y],
                                        cursorColor: Colors.black,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: maxLines,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          labelText: 'Description',
                                          labelStyle: TextStyle(fontSize: 16),
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(
                                              left: 15,
                                              bottom: 10,
                                              top: 15,
                                              right: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onChange: (bool value) {
                              setState(() {
                                status[y] = value;
                              });
                            },
                            value: status[y],
                          ),
                        ));
                        i++;
                        setState(() {});
                      } else {
                        disable = true;
                        setState(() {});
                      }
                    },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown[100],
                child: Icon(Icons.add, color: Colors.black38),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 20),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () {
                setState(() {
                  ed = false;
                  we = true;
                  skills = false;
                  lg = false;
                  art = false;
                });
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown[100],
                child: Icon(Icons.double_arrow_rounded, color: Colors.black38),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              "Education",
              style: TextStyle(
                fontFamily: 'NerkoOne',
                letterSpacing: 2.0,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.save, color: Colors.black),
              onPressed: () {
                if (_formKeyeduction.currentState.validate()) {
                  eductionarr = [];
                  var o = 0;
                  for (var item in lycee) {
                    eductionarr.add(
                      {
                        "school": lycee[o].text,
                        "year": yeareduction[o].text,
                        "note": note[o].text
                      },
                    );
                    o++;
                  }

                  saveedu(widget.user.user[0].id, eductionarr, widget.templete);
                  setState(() {
                    ed = false;
                    we = true;
                    skills = false;
                    lg = false;
                    art = false;
                  });
                  print(eductionarr);
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
        body: Stack(
          children: [
            Form(
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
                child: ListView.builder(
                  itemCount: aducctionelemnt.length,
                  itemBuilder: (context, index) {
                    return aducctionelemnt[index];
                  },
                ),
              )),
            ),
            aducctionelemnt.length == 0
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Press + to add fields \n Please enter your education \n information (Limit: 1)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ))
                : Container(),
          ],
        ),
      );
    } else if (we) {
      //WORKING EXPERIENCE
      print(eductionarr);
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: "btn9",
              onPressed: () {
                var nj = u;
                status1.add(true);
                company.add(TextEditingController());
                yearcompany.add(TextEditingController());
                postion.add(TextEditingController());
                workelemnt.add(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Collapse(
                    title: Container(
                      child: Text(
                        'Work Experience \nInclude your last 5 years of relevant experience and dates in this section. \n List your most recent position first. \n (Eg : 2012-2015 Web Developer \n Racun Tech Sdn.Bhd )',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    body: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 10,
                                          left: 10,
                                          top: 0,
                                          bottom: 2),
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
                                        controller: company[u],
                                        cursorColor: Colors.black,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          labelText: 'Company',
                                          labelStyle: TextStyle(fontSize: 14),
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
                                          right: 10,
                                          left: 10,
                                          top: 0,
                                          bottom: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        controller: yearcompany[u],
                                        cursorColor: Colors.black,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          labelText: 'Year',
                                          labelStyle: TextStyle(fontSize: 14),
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
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 150.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                controller: postion[u],
                                cursorColor: Colors.black,
                                maxLines: null,
                                expands: true,
                                keyboardType: TextInputType.multiline,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  labelText: 'Position',
                                  labelStyle: TextStyle(fontSize: 14),
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 10, top: 11, right: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    value: status1[nj],
                    onChange: (bool value) {
                      setState(() {
                        status1[nj] = value;
                      });
                    },
                    // value: status1[nj],
                  ),
                ));
                u++;
                setState(() {});
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown[100],
                child: Icon(Icons.add, color: Colors.black38),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 20),
            FloatingActionButton(
              heroTag: "btn8",
              onPressed: () {
                setState(() {
                  ed = false;
                  we = false;
                  skills = true;
                  lg = false;
                  art = false;
                });
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown[100],
                child: Icon(Icons.double_arrow_rounded, color: Colors.black38),
              ),
            )
          ],
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              " Working Experience",
              style: TextStyle(
                fontFamily: 'NerkoOne',
                letterSpacing: 2.0,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.save, color: Colors.black),
              onPressed: () {
                if (_formKeyworkex.currentState.validate()) {
                  workarr = [];
                  var y = 0;
                  for (var item in company) {
                    workarr.add(
                      {
                        "company": company[y].text,
                        "year": yearcompany[y].text,
                        "postion": postion[y].text,
                      },
                    );
                    y++;
                  }

                  saveexp(widget.user.user[0].id, workarr, widget.templete);
                  print(eductionarr);
                  print(workarr);
                  setState(() {
                    ed = false;
                    we = false;
                    skills = true;
                    lg = false;
                    art = false;
                  });
                }
              },
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              setState(() {
                ed = true;
                we = false;
                skills = false;
                lg = false;
                art = false;
              });
            },
          ),
        ),
        body: Stack(
          children: [
            Form(
              key: _formKeyworkex,
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
                child: ListView.builder(
                  itemCount: workelemnt.length,
                  itemBuilder: (context, index) {
                    return workelemnt[index];
                  },
                ),
              )),
            ),
            workelemnt.length == 0
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Press + to add fields \n Please enter your working experience \n information (limit: 5) ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ))
                : Container(),
          ],
        ),
      );
    } else if (art) {
      //AWARDDDDD
      print(eductionarr);
      print(workarr);
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: "btn5",
              onPressed: () {
                var arn = arindex;
                status2.add(true);
                ar.add(TextEditingController());
                ar1.add(TextEditingController());
                awrelemnt.add(
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Collapse(
                      title: Container(
                        child: Text(
                            'Describe your award if any or skip to next page',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            )),
                      ),
                      body: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: TextFormField(
                                          style: TextStyle(fontSize: 12),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                          controller: ar[arn],
                                          cursorColor: Colors.black,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            labelText: 'Award',
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
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin:
                                    EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 220.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: ar1[arn],
                                  cursorColor: Colors.black,
                                  maxLines: null,
                                  expands: true,
                                  keyboardType: TextInputType.multiline,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Describe your award',
                                    labelStyle: TextStyle(fontSize: 16),
                                    isDense: true,
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 10,
                                        top: 11,
                                        right: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      value: status2[arn],
                      onChange: (bool value) {
                        setState(() {
                          status2[arn] = value;
                        });
                      },
                    ),
                  ),
                );
                arindex++;
                setState(() {});
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown[100],
                child: Icon(Icons.add, color: Colors.black38),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 20),
            FloatingActionButton(
              heroTag: "btn6",
              onPressed: () {
                setState(() {
                  ed = false;
                  we = false;
                  skills = false;
                  lg = true;
                  art = false;
                });
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown[100],
                child: Icon(Icons.double_arrow_rounded, color: Colors.black38),
              ),
            )
          ],
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              " Award & Achievement",
              style: TextStyle(
                fontFamily: 'NerkoOne',
                letterSpacing: 2.0,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.save, color: Colors.black),
              onPressed: () {
                if (_formKeyeduction.currentState.validate()) {
                  awarr = [];
                  var m = 0;
                  for (var item in ar) {
                    awarr.add(
                      {"filepath": ar[m].text, "text": ar1[m].text},
                    );
                    m++;
                  }

                  saveaward(widget.user.user[0].id, awarr);

                  setState(() {
                    ed = false;
                    we = false;
                    skills = false;
                    lg = true;
                    art = false;
                  });
                  print(eductionarr);
                  print(workarr);
                  print(skillsarr);
                }
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Stack(children: [
          Form(
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
                child: Stack(
                  children: [
                    Form(
                      key: _formKeyar,
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
                        child: ListView.builder(
                          itemCount: awrelemnt.length,
                          itemBuilder: (context, index) {
                            return awrelemnt[index];
                          },
                        ),
                      )),
                    ),
                    workelemnt.length == 0
                        ? Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Press + to add fields \n Please enter you award and  \n  achievement if any (Limit: 5)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: 2.0,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ))
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ]),
      );
    } else if (lg) {
      //LANGUAGE
      print(eductionarr);
      print(workarr);
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                var k = l;
                lgn.add(TextEditingController());
                lgelemnt.add(
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 6,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 1.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18, left: 25, right: 18, bottom: 8),
                            child: Text(
                              " Plase list your language proficiency if any \n(Eg: Malay, English, Mandarin",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                controller: lgn[k],
                                cursorColor: Colors.black,
                                maxLines: null,
                                expands: true,
                                keyboardType: TextInputType.multiline,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  labelText: 'Language ' + (k + 1).toString(),
                                  labelStyle: TextStyle(fontSize: 16),
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 10, top: 11, right: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                l++;
                setState(() {});
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown[100],
                child: Icon(Icons.add, color: Colors.black38),
              ),
              heroTag: "btn3",
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 20),
            FloatingActionButton(
              onPressed: () {
                ed = false;
                lg = false;
                skills = false;
                we = false;
                art = false;
                setState(() {});
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown[100],
                child: Icon(Icons.double_arrow_rounded, color: Colors.black38),
              ),
              heroTag: "btn4",
            )
          ],
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              "Language",
              style: TextStyle(
                fontFamily: 'NerkoOne',
                letterSpacing: 2.0,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.save, color: Colors.black),
              onPressed: () {
                if (_formKeylg.currentState.validate()) {
                  lgarr = [];
                  var p = 0;
                  for (var item in lgn) {
                    lgarr.add(
                      {
                        "lang": lgn[p].text,
                      },
                    );
                    p++;
                  }

                  savelang(widget.user.user[0].id, lgarr, widget.templete);
                  ed = false;
                  lg = false;
                  skills = false;
                  we = false;
                  art = false;
                  setState(() {});

                  print(eductionarr);
                  print(workarr);
                  print(skillsarr);
                }
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Stack(
          children: [
            Form(
              key: _formKeylg,
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
                child: ListView.builder(
                  itemCount: lgelemnt.length,
                  itemBuilder: (context, index) {
                    return lgelemnt[index];
                  },
                ),
              )),
            ),
            lgelemnt.length == 0
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Press + to add fields\nPlease enter your language \n proficiency (Limit: 5)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      );
    } else if (skills) {
      print(eductionarr);
      print(workarr);
      //skillsssssssss
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: "btn47",
              onPressed: () {
                if (skelemnt.length != 0 && skelemnt.length < 5) {
                  sk.add(
                    TextEditingController(),
                  );
                }
                if (skelemnt.length < 5) {
                  skelemnt.add(
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18, left: 25, right: 18, bottom: 8),
                            child: Text(
                              " Plase list your skills \n(Eg: CSS, HTML, Baking, Cooking",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
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
                                controller: sk[k],
                                cursorColor: Colors.black,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  labelText: 'Skills ' + (k + 1).toString(),
                                  labelStyle: TextStyle(fontSize: 16),
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  k++;
                } else if (skelemnt[0] ==
                    Center(
                        child: Text(
                      "Press + to add fields\nPlease enter atleast 5 of your skills",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ))) {
                  skelemnt.removeAt(0);
                  skelemnt.add(
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              " Skillshhh " + i.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                controller: sk[i],
                                cursorColor: Colors.black,
                                maxLines: null,
                                expands: true,
                                keyboardType: TextInputType.multiline,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 10, top: 11, right: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                setState(() {});
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown[100],
                child: Icon(Icons.add, color: Colors.black38),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 20),
            FloatingActionButton(
              heroTag: "btn45",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Displayjob(
                      template: widget.templete,
                      user: widget.user,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.brown[100],
                child: Icon(Icons.double_arrow_rounded, color: Colors.black38),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              "Skills",
              style: TextStyle(
                fontFamily: 'NerkoOne',
                letterSpacing: 2.0,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.save, color: Colors.black),
              onPressed: () async {
                if (_formKeyskills.currentState.validate()) {
                  for (var item in sk) {
                    skillsarr.add(
                      {
                        "skilss": item.text,
                      },
                    );
                  }

                  var test = await saveskils(
                      widget.user.user[0].id, skillsarr, widget.templete);

                  if (test) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Displayjob(
                                template: widget.templete,
                                user: widget.user,
                              )),
                    );
                  } else {}
                }
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKeyskills,
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
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Column(children: skelemnt)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            skelemnt.length == 0
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Press + to add fields\nPlease enter atleast 5 of your skills",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      );
    } else {
      print(eductionarr);
      print(workarr);
      print(skillsarr);

      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              " ",
              style: TextStyle(
                fontFamily: 'NerkoOne',
                letterSpacing: 2.0,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check,
                  color: Colors.green[400],
                  size: 40,
                ),
                Text(
                  " Your resume is saved",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'JustAnotherHand',
                    letterSpacing: 4.0,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResumePage(user: widget.user)),
                      );
                    },
                    child: const Text('Preview Resume',
                        style: TextStyle(fontSize: 18)),
                    color: Colors.grey[300],
                    textColor: Colors.black,
                    elevation: 5,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Homepage(user: widget.user)),
                                    );
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
              ],
            )),
      );
    }
  }
}

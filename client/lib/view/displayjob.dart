import 'package:flutter/material.dart';
import 'package:client/controller/getjob.dart';
import 'package:client/model/user.dart';
import 'package:client/view/creerusme.dart';

class Displayjob extends StatefulWidget {
  final User user;
  final template;
  Displayjob({this.user, this.template});
  @override
  _DisplayjobState createState() => _DisplayjobState();
}

class _DisplayjobState extends State<Displayjob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.double_arrow_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Creerusme(
                            templete: widget.template,
                            user: widget.user,
                            skills: false,
                            we: false,
                            ed: false,
                            ar: true,
                            lg: false)),
                  );
                })
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Your job preferences based on your skills is...",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'SignikaNegative',
                    )),
              ),
              Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2,
                  color: Colors.grey[200],
                  child: FutureBuilder<dynamic>(
                    future: getjob(widget.user), // async work
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasData == false)
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " Sorry, no job can be identified \n Please complete your resume first and click on saved button  ",
                                  style: TextStyle(color: Colors.red[600]),
                                ),
                              ),
                            );
                          else
                            return Row(
                              children: [
                                Column(
                                  children: [
                                    Text(" ",
                                        style: TextStyle(
                                            color: Colors.blueAccent)),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.width /
                                                  2 -
                                              20,
                                      child: ListView.builder(
                                          itemCount:
                                              snapshot.data["indeed"].length,
                                          itemBuilder: (BuildContext context,
                                              int position) {
                                            return snapshot.data["indeed"]
                                                        [position] ==
                                                    null
                                                ? Container()
                                                : Card(
                                                    child: Container(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                  child: Text(
                                                                snapshot.data[
                                                                        "indeed"]
                                                                    [position],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              )),
                                                            ],
                                                          ),
                                                          Divider(),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                          }),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("",
                                        style: TextStyle(color: Colors.green)),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          20,
                                      height:
                                          MediaQuery.of(context).size.width /
                                                  2 -
                                              20,
                                      child: ListView.builder(
                                          itemCount:
                                              snapshot.data["glassdoor"].length,
                                          itemBuilder: (BuildContext context,
                                              int position) {
                                            return Card(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            snapshot.data[
                                                                    "glassdoor"]
                                                                [position],
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ],
                            );
                      }
                    },
                  ),
                ),
              ),
              Center(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Creerusme(
                                  templete: widget.template,
                                  user: widget.user,
                                  skills: false,
                                  we: false,
                                  ed: false,
                                  ar: true,
                                  lg: false)),
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
            ],
          )),
        ));
  }
}

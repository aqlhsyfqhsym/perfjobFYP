import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:client/controller/decryp.dart';
import 'package:client/controller/ediitcon.dart';
import 'package:client/model/user.dart';
import 'package:client/view/homepage.dart';

import 'package:prefjob/view/rsumepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulHookWidget {
  final user1;
  EditProfile({this.user1});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKeyuser = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<FormState> _formKeyuser = GlobalKey<FormState>();
    // final GlobalKey<FormState> _formKeyuser = new GlobalKey<FormState>();

    FocusNode focusNode = new FocusNode();
    FocusNode focusNode1 = new FocusNode();
    FocusNode focusNode2 = new FocusNode();
    FocusNode focusNode3 = new FocusNode();
    var _image = useState();
    _imgFromCamera() async {
      // ignore: deprecated_member_use
      File image = await ImagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 50);

      _image.value = image;
    }

    _imgFromGallery() async {
      // ignore: deprecated_member_use
      File image = await ImagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 50);

      _image.value = image;
    }

    void _showPicker(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text('Photo Library'),
                        onTap: () async {
                          await _imgFromGallery();
                          _image.value = _image.value.readAsBytesSync();
                          print(_image.value);
                          Navigator.of(context).pop();
                        }),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: () async {
                        await _imgFromCamera();
                        _image.value = _image.value.readAsBytesSync();
                        print(_image.value);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }

    var lodaing = useState(false);
    var user = useState(widget.user1);

    final name = TextEditingController(text: user.value.user[0].fullname);
    final username = TextEditingController(text: user.value.user[0].username);
    final email = TextEditingController(text: user.value.user[0].email);
    final password = TextEditingController();

    // var skillsarr = [];
    // var workarr = [];
    // var contactarr = [];
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(
              fontFamily: 'NerkoOne',
              letterSpacing: 4.0,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
        actions: [
          lodaing.value == true
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ))
              : IconButton(
                  icon: Icon(Icons.save, color: Colors.black),
                  onPressed: () async {
                    if (_formKeyuser.currentState.validate()) {
                      lodaing.value = true;
                      var i;

                      var ig = _image.value == null
                          ? user.value.user[0].photo
                          : base64.encode(_image.value);

                      if (password.text == "") {
                        i = user.value.user[0].password;
                      } else {
                        i = await dec(password.text);
                      }

                      Map<String, dynamic> userinfo = {
                        "user": [
                          {
                            "Id": user.value.user[0].id,
                            "fullname": name.text == ""
                                ? user.value.user[0].fullname
                                : name.text,
                            "email": email.text == ""
                                ? user.value.user[0].email
                                : email.text,
                            "username": username.text == ""
                                ? user.value.user[0].username
                                : username.text,
                            "password": i,
                            "Photo": ig,
                          }
                        ]
                      };

                      var t = User.fromJson(userinfo);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("user", json.encode(userinfo));

                      print(t);
                      var test = await editprofile(t);

                      // ignore: prefer_final_locals
                      if (test) {
                        lodaing.value = false;
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage(
                                      user: t,
                                    )),
                            (Route<dynamic> route) => false);
                      }
                    }
                  },
                ),
        ],
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Homepage(
                            user: user.value,
                          )),
                  (Route<dynamic> route) => false);
            }),
      ),
      body: Form(
        key: _formKeyuser,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              //image
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
                  Expanded(
                    flex: 0,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 1.0),
                      child: Text(
                        " \n Click on saved icon to save your change ",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 1.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  child: _image.value == null
                                      ? Icon(
                                          Icons.add,
                                          size: 50,
                                          color: Colors.grey,
                                        )
                                      : Image.memory(
                                          _image.value,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.fill,
                                        ),
                                  radius: 35,
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
                                Text("Change your photo"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18, left: 18, right: 18, bottom: 8),
                            child: Text("Username"),
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
                                focusNode: focusNode,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                controller: username,
                                cursorColor: Colors.black,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
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
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18, left: 18, right: 18, bottom: 8),
                            child: Text("Change \nPassword"),
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
                                focusNode: focusNode1,
                                controller: password,
                                cursorColor: Colors.black,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
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
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18, left: 18, right: 18, bottom: 8),
                            child: Text(
                              "Fullname ",
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
                                focusNode: focusNode2,
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
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
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
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18, left: 18, right: 18, bottom: 8),
                            child: Text("Change   \nE-mail      "),
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
                                focusNode: focusNode3,
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
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18),
                            child: Container(
                              child: Align(
                                heightFactor: 50,
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 50,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.arrow_back,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          Text("BACK",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
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
                  ),
                  Container(
                    child: FlatButton(
                      onPressed: () async {
//                       var test =
//                           await savecontact(widget.user.user[0].id, contactarr);
//                       if (test) {
//                         Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Creerusme(
//                                       user: widget.user,
//                                     )),
//                             (Route<dynamic> route) => false);
//                       } else {
//                         final snackBar =
//                             SnackBar(content: Text("you miss samthing "));

// // Find the Scaffold in the widget tree and use it to show a SnackBar.
//                         Scaffold.of(context).showSnackBar(snackBar);
//                       }
                      },
                      child: Text(" "),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

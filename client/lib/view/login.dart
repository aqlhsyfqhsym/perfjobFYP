import 'package:flutter/material.dart';
import 'package:client/controller/login.dart';
import 'package:client/controller/register.dart';
import 'package:client/view/homepage.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  var register = false;
  var loding = false;
  var faill = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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
              children: [
                SizedBox(height: MediaQuery.of(context).size.width / 6),
                Text(
                  "PerfJob",
                  style: TextStyle(
                      fontSize: 55,
                      fontFamily: 'JustAnotherHand',
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(1.0, 1.0),
                        ),
                      ]),
                ),
                Text(
                  "find your ideal job here",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Sacramento',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width / 15),
                loding == false
                    ? register == false
                        ? logincard(context)
                        : registercard(context)
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      if (register == false) {
                        register = true;
                      } else {
                        register = false;
                      }
                      setState(() {});
                    },
                    child: Text(
                        register == false
                            ? "I Don't Have an Account Yet"
                            : "I Have an Account",
                        style: TextStyle(
                          fontSize: 11,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logincard(context1) {
    final username = TextEditingController();
    final password = TextEditingController();

    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 2 +
              MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 3 +
              MediaQuery.of(context).size.height / 4,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 18,
                    right: 18,
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rancho'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 18, left: 18, right: 18, bottom: 8),
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
                        hintText: "username"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 18, right: 18, bottom: 18),
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
                    controller: password,
                    cursorColor: Colors.black,
                    obscureText: _isHidden,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Password",
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 7,
                  child: FlatButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        loding = true;
                        setState(() {});

                        var user = await login(username.text, password.text);
                        loding = false;
                        setState(() {});

                        // ignore: unrelated_type_equality_checks
                        if (user == "username or password not correct") {
                          faill = true;
                          setState(() {});
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage(user: user)),
                          );
                        }
                      }
                    },
                    child: Text(
                      "log in",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Center(
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Forget password?",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              faill == true
                  ? Text("username or password not correct")
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Widget registercard(context1) {
    final username = TextEditingController();
    final password = TextEditingController();
    final email = TextEditingController();
    final fullname = TextEditingController();

    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 2 +
              MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 3 +
              MediaQuery.of(context).size.height / 4,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 18,
                    right: 18,
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  left: 18,
                  right: 18,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: fullname,
                    cursorColor: Colors.black,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Fullname"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 18,
                  right: 18,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
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
                        hintText: "username"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 18, right: 18, bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
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
                        hintText: "Email"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 18, right: 18, bottom: 18),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: password,
                    cursorColor: Colors.black,
                    obscureText: _isHidden,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Password",
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 18,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 7,
                  child: FlatButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        loding = true;
                        setState(() {});

                        var user = await registera(username.text, fullname.text,
                            password.text, email.text);
                        loding = false;
                        setState(() {});

                        // ignore: unrelated_type_equality_checks
                        if (user == false) {
                          faill = true;
                          setState(() {});
                        } else {
                          register = false;
                          setState(() {});
                        }
                      }
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              faill == true ? Text("Samething not good") : Container()
            ],
          ),
        ),
      ),
    );
  }
}

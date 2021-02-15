import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:client/controller/login.dart';
import 'package:client/view/homepage.dart';
import 'package:client/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatefulHookWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<MyApp> {
  Future<dynamic> getuser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = prefs.get('username');
    var password = prefs.get('password');
    var user = await login(username, password);
    return user;
  }

  @override
  void initState() {
    getuser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user1 = useState();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Perfjob Apps',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: FutureBuilder<dynamic>(
            future: getuser(), // async work
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  user1.value = snapshot.data;
                  return (user1.value == "username or password not correct" ||
                          user1.value == null)
                      ? Loginpage()
                      : Homepage(
                          user: user1.value,
                        );
              }
            },
          ),
        ));
  }
}

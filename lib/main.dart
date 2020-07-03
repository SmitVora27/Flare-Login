import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(38, 50, 56, 1),
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pass = "admin";

  String animationType = "idle";

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          animationType = "test";
        });
      } else {
        animationType = "idle";
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //just for vertical spacing
        SizedBox(
          height: 60,
          width: 200,
        ),

        //space for teddy actor
        Center(
          child: Container(
            height: 300,
            width: 300,
            child: CircleAvatar(
              child: ClipOval(
                child: new FlareActor(
                  "assets/teddy_test.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animationType,
                ),
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),

        //just for vertical spacing
        SizedBox(
          height: 80,
          width: 10,
        ),

        //container for textfields user name and password
        Container(
          height: 140,
          width: 390,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Username",
                    contentPadding: EdgeInsets.all(20)),
              ),
              Divider(),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    contentPadding: EdgeInsets.all(20)),
                controller: passwordController,
                focusNode: passwordFocusNode,
              ),
            ],
          ),
        ),

        //container for raised button
        Container(
          width: 390,
          height: 80,
          padding: EdgeInsets.only(top: 30),
          child: RaisedButton(
            color: Colors.pink,
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              if (passwordController.text.compareTo(pass) == 0) {
                setState(() {
                  animationType = "success";
                });
              } else {
                setState(() {
                  animationType = "fail";
                });
              }
            },
          ),
        ),
      ],
    );
  }
}

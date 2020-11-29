import 'package:flutter/material.dart';

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/mental-health.png",
      fit: BoxFit.fill,
      width: 100.0,
      height: 100.0,
    );

    final loginButton = Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          print("Login Pressed");
        },
      ),
    );

    final registerButton = Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          print("Register Pressed");
        },
      ),
    );

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 80),
          child: registerButton,
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color(0XFFFFFEBEE),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Text(
            //   'Welcome to Furaha',
            //   textAlign: TextAlign.center,

            //   style: TextStyle(
            //       fontSize: 40.0,
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: logo,
            ),

            buttons,
          ],
        ),
      ),
    );
  }
}

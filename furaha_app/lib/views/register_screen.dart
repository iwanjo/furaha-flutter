import 'package:flutter/material.dart';
import 'package:furaha_app/theme/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _confirmPasswordController;
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/mental-health.png",
      fit: BoxFit.fill,
      width: 80.0,
      height: 80.0,
    );

    final welcomeMsg = Column(
      children: <Widget>[
        Text(
          'Create an account with us today for free',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ],
    );

    final userNameField = TextFormField(
      controller: _usernameController,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: "Full Name",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: "Email Address",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final passwordField = Column(
      children: <Widget>[
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          // keyboardType: TextInputType.visiblePassword,
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: "Password",
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
      ],
    );

    final confirmPasswordField = Column(
      children: <Widget>[
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: true,
          // keyboardType: TextInputType.visiblePassword,
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: "Confirm Password",
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
      ],
    );
    final fields = Padding(
      padding: EdgeInsets.all(13.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //userName,
          userNameField,
          emailField,
          passwordField,
          confirmPasswordField,
        ],
      ),
    );

    final registerButton = Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(17.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: mq.size.width / 1.7,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          // Navigator.of(context).pushNamed(AppRoutes.authRegister);
          try {
            User user =
                (await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text,
            ))
                    .user;

            if (user != null) {}
          } catch (e) {
            print(e);
            //alert error
            _usernameController.text = "";
            _emailController.text = "";
            _passwordController.text = "";
            _confirmPasswordController.text = "";
          }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //sign in button
        Padding(
          padding: EdgeInsets.all(7.0),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Already have an account?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.blue[700]),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.authLogin);
              },
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.blue[700],
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFFB3E5FC),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 40.0)),
                logo,
                Padding(padding: EdgeInsets.only(top: 40.0)),
                welcomeMsg,
                Padding(padding: EdgeInsets.only(top: 30.0)),
                fields,
                Padding(padding: EdgeInsets.only(top: 30.0)),
                registerButton,
                Padding(padding: EdgeInsets.only(bottom: 20.0)),
                bottom,
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
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

    final welcomeImg = Image.asset(
      "assets/welcome.png",
      fit: BoxFit.fill,
      height: 150.0,
      width: 150.0,
    );

    final welcomeMsg = Column(
      children: <Widget>[
        Text(
          'Welcome Back to Furaha',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ],
    );

    final emailField = TextFormField(
      enabled: isSubmitting,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: 'johndoe@gmail.com',
        labelText: "Email Address",
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final passwordField = Column(
      children: <Widget>[
        TextFormField(
          enabled: isSubmitting,
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: "Password",
            hintStyle: TextStyle(
              color: Colors.white,
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
          emailField,
          passwordField,
          //user password
        ],
      ),
    );

    final loginButton = Material(
      elevation: 4.0,
      borderRadius: BorderRadius.circular(17.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: mq.size.width / 1.7,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          // Navigator.of(context).pushNamed(AppRoutes.authRegister);
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
              "Don't have an account?",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.blue[700]),
            ),
            MaterialButton(
              child: Text(
                'Sign Up',
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
                welcomeImg,
                Padding(padding: EdgeInsets.only(top: 30.0)),
                fields,
                loginButton,
                bottom,
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:groupproject/pages/authenticate/sign_up.dart';
import 'package:groupproject/pages/authenticate/login.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return SignIn(toggleView:  toggleView);
    } else {
      return Register(toggleView:  toggleView);
    }
  }
}
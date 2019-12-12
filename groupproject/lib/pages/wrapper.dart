import 'package:groupproject/homepage.dart';
import 'package:groupproject/models/user.dart';
import 'package:groupproject/pages/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    // return either the MyHomePage or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return MyHomePage();
    }
    
  }
}
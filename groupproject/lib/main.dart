import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:groupproject/driverinvites.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:groupproject/pages/wrapper.dart';
import 'package:groupproject/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:groupproject/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        // title: 'OnTech Carpool',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        // home: MyHomePage(title: 'OnTech Carpool'),
        home: Wrapper(),
        localizationsDelegates: [
          FlutterI18nDelegate(
            useCountryCode: false,
            fallbackFile: 'en',
            path: 'assets/i18n',
          ),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
    ),
    );
    
  }
}



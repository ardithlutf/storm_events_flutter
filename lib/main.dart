import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stormeventslima/router.dart';
import 'package:stormeventslima/themes.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Storm Events App',
      theme: lightTheme,
      onGenerateRoute: Router.generateRoute,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
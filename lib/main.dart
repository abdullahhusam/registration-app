import 'package:flutter/material.dart';
import 'homepage.dart';
import 'welcomepage.dart';
import 'users_reg.dart';
import 'package:gsheets/gsheets.dart';
import 'exitPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserReg.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      routes: <String, WidgetBuilder>{
        'homepage': (context) => HomePage(),
        'exitpage': (context) => ExitPage()
      },
    );
  }
}

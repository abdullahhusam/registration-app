import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(35, 35, 102, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to The Registration App',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'To Start Registration, Please Press Begin',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 150,
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, 'homepage');
                  });
                },
                child: Text(
                  'BEGIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                color: Colors.white,
                textColor: Color.fromRGBO(35, 35, 102, 1),
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              )
            ],
          ),
        ));
  }
}

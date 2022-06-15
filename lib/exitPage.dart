import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitPage extends StatefulWidget {
  const ExitPage({Key? key}) : super(key: key);

  @override
  _ExitPageState createState() => _ExitPageState();
}

class _ExitPageState extends State<ExitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(35, 35, 102, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thank You For Your Registration',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'Your Data Has Been Saved Succesfully!',
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
                  SystemNavigator.pop();
                },
                child: Text(
                  'EXIT',
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

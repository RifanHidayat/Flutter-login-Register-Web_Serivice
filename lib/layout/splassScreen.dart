import 'dart:async';
import 'package:appservice/layout/Login.dart';
import 'package:flutter/material.dart';
class SplassScreen extends StatefulWidget {
  @override
  _SplassScreenState createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  void initState(){
    startTimer();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blue[400]),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          color: Colors.amberAccent,
                          size: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),

                      ),
                      Text(
                        "Mahasiswa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,

                        ),
                      )
                    ],
                  ),

                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(

                      backgroundColor: Colors.lightBlue,

                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),

                  ],
                ),
              )

            ],
          )
        ],

      ),


    );
  }
  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 3), onDone);
  }
  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>LoginScreen()
    ));
  }

}

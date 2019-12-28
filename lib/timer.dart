import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: timerPage(),
    );
  }
}

class timerPage extends StatefulWidget {
  @override
  _timerPage createState() => _timerPage();
}

class _timerPage extends State<timerPage> {
  int time01 = 60;
  int time02 = 60;
  bool time01_start = false;
  bool time02_start = false;

  var period = const Duration(seconds: 1);

  void time01_button_event(){
    if (time01_start){
      time01_start = false;
    }
    else{
      time01_start = true;
    }

    Timer.periodic(period, (timer) {
      if (time01 < 1 || time01_start == false) {
        timer.cancel();
        timer = null;
      }
      else{
        time01--;
      }
      setState(() {});
    });
  }

  void time02_button_event(){
    if (time02_start){
      time02_start = false;
    }
    else{
      time02_start = true;
    }

    Timer.periodic(period, (timer) {
      if (time02 < 1 || time02_start == false) {
        timer.cancel();
        timer = null;
      }
      else{
        time02--;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('$time01', style: TextStyle(fontSize: 40)),
                  RaisedButton(
                    onPressed: () => time01_button_event(),
                    child: Text(time01_start?'PAUSE':'START'),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width/5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('$time02', style: TextStyle(fontSize: 40)),
                  RaisedButton(
                    onPressed: () => time02_button_event(),
                    child: Text(time02_start?'PAUSE':'START'),
                  )
                ],
              ),
            ],
          )
        )
    );
  }
}
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rotation = true;
  int chess_num = 0;
  List white_time = [0, 0, 60, 0, 0];

  void _rotationEvent() {
    setState(() {
      if (rotation){
        rotation = false;
      }
      else{
        rotation = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: SizedBox(
                width: MediaQuery.of(context).size.width/5*4,
                height: MediaQuery.of(context).size.width/5*4,
                child: GestureDetector(
                  onTap: () {
                    print('Pressed.');
                  },
                  child: Transform.rotate(
                      angle: rotation ? pi : -pi/2,
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          child: Text(white_time[2].toString(), style: TextStyle(fontSize: 120),
                          ),
                        )
                      )
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/11,
              child: Center(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.access_alarm),
                      onPressed: () => print('test'),
                    ),
                    Transform.rotate(
                      angle: rotation ? 0 : -pi/2,
                      child: IconButton(
                        icon: Image.asset('assets/reload.png'),
                        onPressed: () => _rotationEvent(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.access_alarm),
                      onPressed: () => print('test'),
                    ),
                  ],
                ),
              ),
            ),
            ClipOval(
              child: SizedBox(
                width: MediaQuery.of(context).size.width/5*4,
                height: MediaQuery.of(context).size.width/5*4,
                child: RaisedButton(
                  color: Colors.black,
                  onPressed: () => print('test'),
                ),
              ),
            ),

            ]
        ),
      )
    );
  }
}

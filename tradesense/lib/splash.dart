import 'dart:async';
import 'package:tradesense/home.dart';
import 'package:flutter/material.dart';
void splash() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home :  SplashScreen(),
));

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();  }
  startTimer() async {
    var duration=Duration(seconds: 2);
    return Timer(duration, route);
  }
  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) =>  HomeScreen()
    ));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit:  StackFit.expand,
        children: <Widget>[
          Container(
            //decoration: BoxDecoration(color: Color.fromRGBO(0, 154, 157, 1.0)),
            decoration: BoxDecoration(color: Color.fromRGBO(67, 90, 177, 1.0)),
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
                      new AnimatedContainer(
                        width: 300,
                        child:  Image.asset('assets/first_logo.png',width: 1000,height: 100,),
                        duration: Duration(seconds: 3),

                      )
                    ],
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(valueColor: AlwaysStoppedAnimation <Color> (Colors.white)),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    )
                  ],
                ),)
            ],)
        ],
      ),
    );
  }
}

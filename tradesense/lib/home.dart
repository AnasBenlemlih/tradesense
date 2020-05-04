import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(67, 90, 177, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),



      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(

                height: 100,
                padding: EdgeInsets.all(10),
                child: Image.asset('assets/logo.png', width: 200,height: 200,),
                alignment: Alignment.center,
                // height: 100,
                //decoration: BoxDecoration(
                //  image: DecorationImage(
                //    image: AssetImage('assets/logo.png'),

                //)
                //),
              ),
              Container(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child:
                        Text('hello'),
                        color: Colors.white,
                        alignment: Alignment.center,
                        width: 300,
                        height: 300,
                      )
                    ],
                  )
              ) //Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';

import 'CustomShapeClipper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(67, 90, 177, 1.0),
        elevation: 0,
        leading: Icon(Icons.menu,color: Colors.white,),
      ),
      body: Column(
        children: <Widget>[
          HomeScreenTopPart()
        ],
      ),
    );
  }
}
class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper() ,
           child: Container(height: 450.0, color: Color.fromRGBO(67, 90, 177, 1.0),
          )
        )
      ],
    );
  }
}

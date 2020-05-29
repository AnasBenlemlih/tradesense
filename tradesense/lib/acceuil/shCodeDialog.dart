import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 class ShCodeDialog  extends StatelessWidget {
   final primaryColor = const Color(0xFF75A2EA);
   final grayColor = const Color(0xFF939393);
   final String title, description, closeButton,closeButtonRoute;

   ShCodeDialog(
       {@required this.title,
         @required this.description,
         @required this.closeButton,
         @required this.closeButtonRoute
       });
   @override
   Widget build(BuildContext context) {
     return Dialog(
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20.0),
       ),
       child: Stack(
         children: <Widget>[
           Container(
             decoration: BoxDecoration(
                 color: Colors.grey,
                 shape: BoxShape.rectangle,
                 borderRadius: BorderRadius.circular(20.0),
                 boxShadow: [
                   BoxShadow(color: Colors.black,
                     blurRadius : 10.0,
                     offset: const Offset(0.0, 10.0),
                   ),
                ]
             ),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 SizedBox(height: 24.0),
                 Text(
                   title,
                 textAlign: TextAlign.center,
                   maxLines: 2,
                   style: (TextStyle(color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,)
                    ),   
                 ),
                 SizedBox(height: 20.0),
                 Text(
                   description,
                   textAlign: TextAlign.center,
                   style: TextStyle(color: Colors.black,
                   fontSize: 18.0,
                 ),
                 ),
                 SizedBox(height: 25.0),
                 RaisedButton(
                   elevation: 5.0,
                   color: Colors.amberAccent,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30.0)),
                   child: Text(
                       closeButton,
                       style: TextStyle(
                         color: Colors.white,
                         letterSpacing: 1.5,
                         fontSize: 14.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   onPressed: () {
                     Navigator.of(context).pop();
                     Navigator.of(context)
                         .pushReplacementNamed(closeButtonRoute);
                   },
                 ),

               ],
             ),
           ),
   ]
     ),
     );
 }}


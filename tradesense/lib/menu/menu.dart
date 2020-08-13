import 'package:flutter/material.dart';
import 'package:tradesense/acceuil/Home.dart';
import 'package:tradesense/accords/accords.dart';
import 'package:tradesense/mesure_sanitaire/MesureSanitaire.dart';

import 'package:tradesense/CustomListTitle.dart';
import 'package:tradesense/procedure/procedure.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      width: 100.0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Color.fromRGBO(67, 90, 177, 1.0),
                Color.fromRGBO(67, 90, 177, 1.0)
              ])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 15,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'TradeSense',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
              )),
          CustomListTitle(Icons.home, 'ACCEUIL', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }),
          CustomListTitle(Icons.history, 'Accualité', () => {}),
        ],
      ),
    ));
  }
}

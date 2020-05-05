

import 'package:flutter/material.dart';
import 'package:tradesense/CustomListTitle.dart';

import 'package:tradesense/CustomShapeClipper.dart';

class MesureSanitaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(67, 90, 177, 1.0),
        title: Text('MesureSanitaire'),
      ),
      drawer: Drawer(
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
                        child: Text('TradeSense',style: TextStyle(color: Colors.white,fontSize: 20.0,),),
                      )
                    ],
                  ),
                )),
            CustomListTitle(Icons.home, 'Accueil', () => {}),
             CustomListTitle(Icons.healing, 'Mesure Sanitaire', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MesureSanitaire()),
              );
            }),
            CustomListTitle(Icons.history, 'Accualité', () => {}),
            CustomListTitle(Icons.perm_media, 'Media', () => {}),
            CustomListTitle(Icons.exit_to_app, 'Quitter', () => {})
          ],
        ),
      ),
      body: Column(
        children: <Widget>[MesureSanitaireScreenTopPart()],
      ),
    );
  }
}

class MesureSanitaireScreenTopPart extends StatefulWidget {
  @override
  _MesureSanitaireScreenTopPartState createState() => _MesureSanitaireScreenTopPartState();
}

class _MesureSanitaireScreenTopPartState extends State<MesureSanitaireScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 450.0,
              color: Color.fromRGBO(67, 90, 177, 1.0),
            ))
      ],
    );
  }
}



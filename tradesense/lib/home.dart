import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tradesense/topPartHome.dart';
import 'CustomShapeClipper.dart';
import 'CustomListTitle.dart';

class HomeScreen extends StatelessWidget {
  //String current ="Régime";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(67, 90, 177, 1.0),
        elevation: 0,
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
            CustomListTitle(Icons.history, 'Accualité', () => {}),
            CustomListTitle(Icons.perm_media, 'Media', () => {}),
            CustomListTitle(Icons.exit_to_app, 'Quitter', () => {})
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          HomeScreenTopPart(),
          SizedBox(height: 20),
            PreventCard(
              text:
              "Accéder à la base de recherche \n  des accords commerciaux.",
              image: "assets/images/icon1.png",
              title: "Accords commerciaux",
            ),
            PreventCard(
              text:
              "Accès au référentiel de mesures\nsanitaires et phytosanitaires.",
              image: "assets/images/icon3.png",
              title: "Mesures sanitaires et \nphytosanitaires",
            ),
            PreventCard(
              text:
              "Accédez au référentiel des \n procedédures.",
              image: "assets/images/icon2.png",
              title: "Procédures",
            ),
          ],
        ),
      ),
    );
  }
}
class OptionCard extends StatelessWidget {
  final String image;
  final String title;
  final String title2;
  final bool isActive;
  const OptionCard({
    Key key,
    this.image,
    this.title,
    this.title2,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: Colors.grey,
          )
              : BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 6,
            color: Colors.grey,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 50),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            title2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                //la couleur du box qui contient l'option
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 10,
                    color: Colors.grey,
                  ),

                ],
              ),
              child: Row(
                children: <Widget>[
                  Image.asset(image),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 60),
                FloatingActionButton(
                      backgroundColor: Colors.amberAccent,
                      onPressed: (){},
                      //  tooltip: 'Increment',
                      child: Icon(Icons.arrow_forward),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


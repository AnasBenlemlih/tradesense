import 'package:flutter/material.dart';
import 'package:tradesense/accords/ListeAccord.dart';
import 'package:tradesense/barriereTechnique/ListeBarriere.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/mesure_sanitaire/ListeMesures.dart';
import 'package:tradesense/rechercheProduit/ResultSelected.dart';
import 'package:tradesense/widget/HeaderListeRecherche.dart';
import 'package:tradesense/procedure/ListeProc.dart';

class ListeRechercheProduit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TradeSense',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: ListeRechercheProduitScreen(),
    );
  }
}

class ListeRechercheProduitScreen extends StatefulWidget {
  @override
  _ListeRechercheProduitScreenState createState() =>
      _ListeRechercheProduitScreenState();
}

class _ListeRechercheProduitScreenState
    extends State<ListeRechercheProduitScreen> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            HeaderListeRecherche(
              regime: "IMPORT",
              pays: "AFRIQUE DU SUD ",
              produit: "ORANGE - 25178569",
              offset: offset,
              color1: 0xFF4056C6,
              color2: 0xFF4056C6,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: Text('Accords commerciaux'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListeAccord(
                                   // on va ajouter d'autres paramètres après 
                                   // des objets (les accords) dans le résultat de recherche 
                            )),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Procédures'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListeProc(
                                   // on va ajouter d'autres paramètres après 
                                   // exemple : des objets (les procédures) dans le résultat de recherche 
                            )),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Mesures sanitaires et phytosanitaires'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListeMesures(

                              // reste d'autres paramètres à ajouter après
                            )),
                      );
                    },
                  ),
                   ListTile(
                    title: Text('Barrières techniques'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListeBarrieres(
                            )),
                      );
                    },

                    
                  ),
                   ListTile(
                    title: Text('Tarif douanier'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultSelectedScreen(
                              titre: "Tarif douanier",
                            )),
                      );
                    },
                   
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

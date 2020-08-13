import 'package:flutter/material.dart';
import 'package:tradesense/accords/ListeAccord.dart';
import 'package:tradesense/barriereTechnique/ListeBarriere.dart';
import 'package:tradesense/mesure_sanitaire/ListeMesures.dart';
import 'package:tradesense/procedure/ListeProc.dart';
import 'package:tradesense/tarifDounanier/DetailsTarif.dart';
import 'package:tradesense/widget/HeaderListeRecherche.dart';

class ResultRechProd extends StatelessWidget {
  // les paramètres que le résultat de recherche va recevoir !
  String regimeId;
  String regimeName;
  String paysId;
  String paysName;
  String produitId;
  String produitName;
  ResultRechProd(
      {this.regimeId,
      this.paysId,
      this.produitId,
      this.paysName,
      this.regimeName,
      this.produitName});
  final controller = ScrollController();
  double offset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            HeaderListeRecherche(
              regime: this.regimeId == "1" ? "IMPORTER" : "EXPORTER",
              pays: "${this.paysName} ",
              produit: "${this.produitName}",
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
                    title: Text(
                        "${this.regimeId}+ ${this.paysId} + ${this.produitId}"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListeBarrieres()),
                      );
                    },
                  ),
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
                            builder: (context) => ListeBarrieres()),
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
                            builder: (context) => DetailsTarif(
                                  listOfColumns: [
                                    "",
                                    "Droits communs",
                                    "Accord d\'association Maroc - Union Européenne"
                                  ],
                                  listOfRows: [
                                    {
                                      "Name": "DI",
                                      "DC": "40 %",
                                      "AAMUE": "0 %"
                                    },
                                    {
                                      "Name": "TPI",
                                      "DC": "0,25 %",
                                      "AAMUE": "(*)"
                                    },
                                    {"Name": "TVA", "DC": "20 %", "AAMUE": "-"},
                                  ],
                                  list: ["Name", "DC", "AAMUE"],
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

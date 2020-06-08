import 'package:flutter/material.dart';
import 'package:tradesense/mesure_sanitaire/DetailsMesure.dart';
import 'package:tradesense/widget/TitleHeader.dart';

import '../info_screen.dart';
import 'DetailsBarriere.dart';
class ListeBarrieres extends StatefulWidget {



  @override
  _ListeProcState createState() => _ListeProcState();
}
class _ListeProcState extends State<ListeBarrieres> {
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
            TitleHeader(
              titre: "Barrières techniques",
              offset: offset,
              // à changer !!
              color1: 0xFF36C12C,
              color2: 0xFF000000,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MesureCard(
                  
                    title: "Etiquetage des produits textiles et de l’habillement (Rèv) -09p.",
                    etablissement: "Ministere de I'lndustrie, de I'lnvestissement, du Commerce et de I'Economie Numerique",
                    zone: "Maroc",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsBarriere(
                           titre: "Etiquetage des produits textiles et de l’habillement (Rèv) -09p.",
                            regime: "Import",
                            titreEtablisement: "Ministere de I'lndustrie, de I'lnvestissement, du Commerce et de I'Economie Numerique",
                            desc: "Donnée indisponible",
                            adresse: "B.P 609-Quartier Administratif,",
                            ville: "RABAT",
                            tel: "05377-61121",
                            fax: "+212 537 76 38 95",
                            email: "Contact@sante.gov.ma",
                            siteWeb: "http://www.sante.gov.ma",
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

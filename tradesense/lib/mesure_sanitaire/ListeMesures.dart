import 'package:flutter/material.dart';
import 'package:tradesense/widget/TitleHeader.dart';

import '../info_screen.dart';
import 'DetailsMesure.dart';

class ListeMesures extends StatefulWidget {
  @override
  _ListeProcState createState() => _ListeProcState();
}

class _ListeProcState extends State<ListeMesures> {
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
              titre: "Mesures sanitaires et phytosanitaires",
              offset: offset,
              color1: 0xFF36C12C,
              color2: 0xFF000000,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MesureCard(
                    regime: "import",
                    title:
                        "FOURNIR UNE NOTIFICATION DES CONCLUSIONS DU CONTRÔLE DES PRODUITS VEGETAUX ET D'ORIGINE VEGETALE",
                    // faut faire des modifications dans AccordCard
                    etablissement: "ONSSA",
                    zone: "Maroc",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsMesure(
                                  titre:
                                      "FOURNIR UNE NOTIFICATION DES CONCLUSIONS DU CONTRÔLE DES PRODUITS VEGETAUX ET D'ORIGINE VEGETALE",
                                  regime: "Import",
                                  zone: "Maroc",
                                  titreEtablisement: "MINISTERE DE LA SANTE",
                                  adresse: "Ministère de la Santé.335. ",
                                  ville: "-",
                                  tel: "05377-61121",
                                  fax: "+212 537 76 38 95",
                                  email: "Contact@sante.gov.ma",
                                  siteWeb: "http://www.sante.gov.ma",
                                )),
                      );
                    },
                  ),
                  MesureCard(
                    regime: "import",
                    title: "FOURNIR LA FACTURE DÛEMENT VISEE",
                    // faut faire des modifications dans AccordCard
                    etablissement:
                        "Département de la santé (Direction du Médicament et de la Pharmacie)",
                    zone: "Maroc",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsMesure(
                                  titre: "FOURNIR LA FACTURE DÛEMENT VISEE",
                                  regime: "Import",
                                  zone: "Maroc",
                                  titreEtablisement:
                                      "DÉPARTEMENT DE LA SANTÉ (DIRECTION DU MÉDICAMENT ET DE LA PHARMACIE)",
                                  adresse: "Rue Lamfadal Charkaoui B.P. ",
                                  ville: "-",
                                  tel: "0537770645/0537 682 289",
                                  fax: "537681931",
                                  email: "info.dmp@sante.gov.ma",
                                  siteWeb: "http://dmp.sante.gov.ma/",
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

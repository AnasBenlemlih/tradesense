import 'package:flutter/material.dart';
import 'package:tradesense/acceuil/Home.dart';
import 'package:tradesense/widget/TitleHeader.dart';
import 'DetailsAccord.dart';

import '../info_screen.dart';

class ListeAccord extends StatefulWidget {
  @override
  _ListeProcState createState() => _ListeProcState();
}

class _ListeProcState extends State<ListeAccord> {
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
              titre: "Accords commerciaux",
              offset: offset,
              color1: 0xFF4056C6,
              color2: 0xFF4056C6,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AccordCard(
                    title: "Offre marocaine en faveur des PMA d'Afrique",
                    // faut faire des modifications dans AccordCard
                    type: "INTERNATIONAL",
                    dentre: "7 janvier 2000",

                    partiesCons: " Pays les moins avancés d'afrique",

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsAccord(
                                  titre:
                                      "Offre marocaine en faveur des PMA d'Afrique",
                                  type: "International",
                                  statut: "En vigueur",
                                  lien: "",
                                  partiesCons:
                                      "Pays les moins avancés d'afrique",
                                  dateApp: "2000-01-07",
                                  dateSignature: "-",
                                  champApp:
                                      "Jusqu'au 31 décembre 2000, cetains produits originaire et en provenance de certains PMA d'Afrique et repris dans deux listes distinctes bénéficiaient, selon le cas, de l'exonération ou de la réduction du droits d'importation."
                                      "A partir du 1er janvier 2001, une liste unique de produits bénéficiant de l'exonération totale de droit d'importation, a remplacé les deux précédentes listes."
                                      "Les produits concernés relèvent essentiellement des règnes animale et végétal, de la pêche, des minerais, des demis-produits....",
                                  regimePref:
                                      "Les produits originaires et en provenance des pays les moins avancés d'Afrique peuvent bénéficier de l'exonération du droit d'importation pour certains produits.",
                                  autorisation: "Donnée indisponible",
                                  infosSuppl: "Donnée indisponible",
                                  conditionActroi:
                                      "Règles d'origine : \nCaractère originaire du produit :\n L'entière obtention. \nOu \nLa transformation suffisante constituée par une valorisation locale d'au moins 40% du prix départ usine du produit exporté.\n Transport direct"
                                      "\nPreuve documentaire du caractère originaire du produit :\n Certificat d'origine : \nConforme au modèle arrêté, délivré et visé par les autorités compétentes des pays bénéficiaires.\n NB :\n"
                                      "Les pays bénéficiaires qui sont en nombre de 34 sont nommément désignés au verso du modèle du certificat d'origine visé ci-contre.",
                                )),
                      );
                    },
                  ),
                  AccordCard(
                    title: "Système généralisé de préférences",
                    // faut faire des modifications dans AccordCard
                    type: "International",
                    partiesCons:
                        " Les pays du système généralisé des préférences",

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
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

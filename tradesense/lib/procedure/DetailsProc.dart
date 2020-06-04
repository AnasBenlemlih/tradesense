import 'package:flutter/material.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/procedure/EtapeProc.dart';
import 'package:tradesense/rechercheProduit/ResultSelected.dart';
import 'package:tradesense/widget/headerDetailRecherche.dart';

class DetailsProc extends StatefulWidget {
  final String titre;
  final String regime;
  final String zone;
  final String desc;
  final String etablisement;
  final List<EtapeProc> etapeProc;

  const DetailsProc(
      {Key key,
      this.titre,
      this.regime,
      this.zone,
      this.desc,
      this.etablisement,
      this.etapeProc})
      : super(key: key);

  @override
  _DetailsProcScreenState createState() => _DetailsProcScreenState();
}

class _DetailsProcScreenState extends State<DetailsProc> {
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
            HeaderDetailRecherche(
              textTop: widget.titre,
              offset: offset,
              color1: 0xFF4056C6,
              color2: 0xFF4056C6,
            ),
            Text(
              'INFORMATIONS DE BASE',
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF4056C6),
                fontSize: 26.0,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Center Row contents horizontally,

                children: <Widget>[
                  Text('RÉGIME : ${widget.regime}'),
                  Text('ZONE : ${widget.zone}'),
                ],
              ),
            ),
            Text(
              'DESCRIPTION',
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF4056C6),
                fontSize: 26.0,
              ),
            ),
            SizedBox(height: 20),
            Text('${widget.desc}'),
            Text(
              'ETABLISSEMENTS',
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF4056C6),
                fontSize: 26.0,
              ),
            ),
            SizedBox(height: 20),
            Text(
                "${widget.etablisement}"),
            Text(
              "ÉTAPES",
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF4056C6),
                fontSize: 26.0,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text(
                  'Étape 1 : Légaliser et certifier conforme les documents'),
              trailing: Icon(Icons.keyboard_arrow_right),
              subtitle: Text(
                  "Zone: Maroc Coût estimé: Donnée indisponible\nTemps de finalisation estimé: Durée non communiquée ou indisponible"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  DetailsProc(
                                  titre:
                                      "Légaliser et certifier conforme les documents",
                                  regime: "IMPORT",
                                  zone: "MAROC",
                                  desc:
                                      "Le statut d'OEA vise à « labéliser » les entreprises sûres et fiables qui présentent d’indéniables garanties en matière de transparence, de solidité financière et de sécurité en vue de leur offrir un package d’avantages dans leurs relations avec l’administration douanière.",
                                  etablisement: "Merci de consulter les étapes pour voir les établissements correspondants",
                                  
                                )),
                      );
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text(
                  "Étape 2 : Déposer la demande d'abonnement au système BADR"),
              trailing: Icon(Icons.keyboard_arrow_right),
              subtitle: Text(
                  "Zone: Maroc Coût estimé: Donnée indisponible\nTemps de finalisation estimé: Durée non communiquée ou indisponible"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultSelected()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Étape 3 : Obtenir les accès au système BADR'),
              trailing: Icon(Icons.keyboard_arrow_right),
              subtitle: Text(
                  "Zone: Maroc Coût estimé: Donnée indisponible\nTemps de finalisation estimé: Durée non communiquée ou indisponible"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultSelected()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

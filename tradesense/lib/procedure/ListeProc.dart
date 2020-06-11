import 'package:flutter/material.dart';
import 'package:tradesense/procedure/DetailsProc.dart';
import 'package:tradesense/widget/TitleHeader.dart';

import '../info_screen.dart';



class ListeProc extends StatefulWidget {



  @override
  _ListeProcState createState() => _ListeProcState();
}
class _ListeProcState extends State<ListeProc> {
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
              titre: "Pocédures",
              offset: offset,
              color1: 0xFFFF8748,
              color2: 0xFFFF4848,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProcedureCard(
                    title: "Procédure préalable à l'\import",
                    // faut faire des modifications dans ProcPreventcard
                    zone: "Maroc",
                    regime: "import",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsProc(
                                  titre:
                                      "Procédure préalable à l'\import",
                                  regime: "Import",
                                  zone: "Maroc",
                                  desc:
                                      "Le statut d'OEA vise à « labéliser » les entreprises sûres et fiables qui présentent d’indéniables garanties en matière de transparence, de solidité financière et de sécurité en vue de leur offrir un package d’avantages dans leurs relations avec l’administration douanière.",
                                titreEtablisement: "SYSTÈME BADR",
                                adresse: "Administration des douanes",
                                // il faut régler le cas ou l'adresse est un long text 
                                tel: "05 37 57 90 00",
                                ville: "rabat",
                                email: "-",
                                siteWeb: "http://www.mcinet.gov.ma" ,
                        )),
                      );
                    },
                  ),
                   ProcedureCard(
                    title: "Procédure d'inscription au système BADR",
                    // faut faire des modifications dans ProcPreventcard
                    zone: "Maroc",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailsProc(
                                  titre:
                                      "Procédure d'inscription au système BADR",
                                  regime: "Import",
                                  zone: "Maroc",
                                  desc:
                                      "Le statut d'OEA vise à « labéliser » les entreprises sûres et fiables qui présentent d’indéniables garanties en matière de transparence, de solidité financière et de sécurité en vue de leur offrir un package d’avantages dans leurs relations avec l’administration douanière.",
                                titreEtablisement: "SYSTÈME BADR",
                                adresse: "Administration des douanes",
                                // il faut régler le cas ou l'adresse est un long text 
                                tel: "05 37 57 90 00",
                                ville: "rabat",
                                email: "-",
                                siteWeb: "http://www.mcinet.gov.ma" ,

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

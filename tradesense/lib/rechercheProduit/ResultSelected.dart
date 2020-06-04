import 'package:flutter/material.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/procedure/DetailsProc.dart';
import 'package:tradesense/widget/HeaderListeRecherche.dart';

class ResultSelected extends StatelessWidget {
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
      home: ResultSelectedScreen(),
    );
  }
}

class ResultSelectedScreen extends StatefulWidget {
  @override
  _ResultSelectedScreenState createState() => _ResultSelectedScreenState();
}

class _ResultSelectedScreenState extends State<ResultSelectedScreen> {
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
              regime: "procédure",
              offset: offset,
              color1: 0xFF36C12C,
              color2: 0xFF000000,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: Text(
                        'Procédure pour devenir un opérateur économique agréé'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsProc(
                                  titre:
                                      "PROCÉDURE POUR DEVENIR UN OPÉRATEUR ÉCONOMIQUE AGRÉÉ",
                                  regime: "IMPORT",
                                  zone: "MAROC",
                                  desc:
                                      "Le statut d'OEA vise à « labéliser » les entreprises sûres et fiables qui présentent d’indéniables garanties en matière de transparence, de solidité financière et de sécurité en vue de leur offrir un package d’avantages dans leurs relations avec l’administration douanière.",
                                  etablisement: "Merci de consulter les étapes pour voir les établissements correspondants",
                                  
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

import 'package:flutter/material.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/info_screen.dart';
import 'package:tradesense/widget/HeaderListeRecherche.dart';

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
              color1: 0xFF36C12C,
              color2: 0xFF000000,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text("Affichage de tout les éléments",
                      style: kTitleTextstyle),
                  SizedBox(height: 10),
                  ProcPreventCard(
                    title: "Accords commerciaux ",
                  ),
                  ProcPreventCard(
                    title: "Procédures ",
                  ),
                  ProcPreventCard(
                    title: "Mesures sanitaires et phytosanitaires  ",
                  ),
                  SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

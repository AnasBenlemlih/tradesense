import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/info_screen.dart';
import 'package:tradesense/widget/my_header.dart';

class Accords extends StatelessWidget {
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
      home: AccordsScreen(),
    );
  }
}

class AccordsScreen extends StatefulWidget {
  @override
  _AccordsScreenState createState() => _AccordsScreenState();
}

class _AccordsScreenState extends State<AccordsScreen> {
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
            MyHeader(
              image: "assets/icons/accords_white.svg",
              textTop: "LES ACCORDS\nCOMMERCIAUX",
              textBottom:
                  "Accéder à la base \nde recherche des \naccords commerciaux",
              offset: offset,
              color1: 0xFF4056C6,
              color2: 0xFF4056C6,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      "assets/icons/search2.svg",
                      width: 30.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text("Affichage de tout les éléments",
                      style: kTitleTextstyle),
                  SizedBox(height: 10),
                  PreventCard(
                    text: "INTERNATIONAL",
                    image: "assets/images/wear_mask.png",
                    title: "SYSTÈME GÉNÉRALISÉ DE PRÉFÉRENCES",
                    dentre: "20/05/2020",
                    dsignature: "06/05/2012",
                    partiesCons: "Pays les moins avancés d'afrique",
                  ),
                  PreventCard(
                    text: "BILATÉRAL",
                    image: "assets/images/wash_hands.png",
                    title: "OFFRE MAROCAINE EN FAVEUR DES PMA D'AFRIQUE",
                    dentre: "07/07/2020",
                    dsignature: "06/03/2016",
                  ),
                  PreventCard(
                    text: "INTERNATIONAL",
                    image: "assets/images/wear_mask.png",
                    title:
                        "ACCORD ENTRE L'UNION EUROPÉENNE (UE) ET LE ROYAUME DU MAROC RELATIF AUX MESURES DE LIBÉRALISATION RÉCIPROQUES EN MATIÈRE DE PRODUITS AGRICOLES, DE PRODUITS AGRICOLES TRANSFORMÉS, DE POISSONS ET DE PRODUITS DE LA PÊCHE",
                    dentre: "20/05/2020",
                    dsignature: "06/05/2012",
                    partiesCons: "Pays les moins avancés d'afrique",
                  ),
                  PreventCard(
                    text: "BILATÉRAL",
                    image: "assets/images/wash_hands.png",
                    title: "OFFRE MAROCAINE EN FAVEUR DES PMA D'AFRIQUE",
                  ),
                  PreventCard(
                    text: "INTERNATIONAL",
                    image: "assets/images/wear_mask.png",
                    title: "SYSTÈME GÉNÉRALISÉ DE PRÉFÉRENCES",
                  ),
                  PreventCard(
                    text: "BILATÉRAL",
                    image: "assets/images/wash_hands.png",
                    title: "OFFRE MAROCAINE EN FAVEUR DES PMA D'AFRIQUE",
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradesense/acceuil/Home.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/info_screen.dart';
import 'package:tradesense/widget/RechercheScreen.dart';
import 'package:tradesense/widget/my_header.dart';

class Procedure extends StatelessWidget {
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
      home: ProcedureScreen(),
    );
  }
}

class ProcedureScreen extends StatefulWidget {
  @override
  _ProcedureScreenState createState() => _ProcedureScreenState();
}

class _ProcedureScreenState extends State<ProcedureScreen> {
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

  final paysValues = ['pays 1', 'pays 2', 'pays 3'];
  final regimeValues = ['IMPORT', 'EXPORT'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/proc.svg",
              textTop: "\nRÉFÉRENTIEL\nDES\nPROCÉDURES",
              textBottom: "",
              offset: offset,
              color1: 0xFFFF8748,
              color2: 0xFFFF4848,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: RaisedButton(
                      elevation: 0.0,
                      child: SvgPicture.asset(
                        "assets/icons/search2.svg",
                        width: 30.0,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RechercheScreen(
                                    titre:
                                        "Accédez au référentiel des procdures",
                                    themeColor:
                                        Color.fromRGBO(252, 124, 76, 1.0),
                                    rechercheHintText: "Chercher une procédure",
                                    hintTextLeft: "Pays",
                                    textFieldLeftValues: paysValues,
                                    hintTextRight: "Régime",
                                    textFieldRightValues: regimeValues,
                                    textFieldBottomIsShown: false,
                                    // j'ai donnée le numéro 3 pour le screen des procédures(aléatoirement)
                                    previousScreen: 3,
                                  )),
                        );
                      },
                      color: Colors.white,
                    ),
                  ),
                  Text("Affichage de tout les éléments",
                      style: kTitleTextstyle),
                  SizedBox(height: 10),
                  ProcedureCard(
                    title: "AUTORISER L'EMBARQUEMENT À L'EXPORTATION",
                    zone: "Maroc",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  ProcedureCard(
                    title: "CONTRÔLE À L’IMPORTATION DES PRODUITS INDUSTRIELS",
                    zone: "Maroc",
                    regime: "import",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  ProcedureCard(
                    title: "DÉPOSER LA DÉCLARATION DUM",
                    zone: "Maroc",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
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

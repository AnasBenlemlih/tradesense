import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradesense/acceuil/Home.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/info_screen.dart';
import 'package:tradesense/widget/RechercheScreen.dart';
import 'package:tradesense/widget/my_header.dart';

import 'DetailsAccord.dart';

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

  final paysValues = [
    'pays 1',
    'pays 2',
    'pays 3',
    'pays4',
    'pays5',
    'pays6',
    'pays7',
    'pays8',
    'pays9',
    'pays10'
  ];
  final typeValues = [
    'Bilatéral',
    'Groupement économique',
    'International',
    'multilatéral'
  ];
  final statutValues = ['En vigueur', 'Négociations', 'Négociations conclues'];

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
                                        "Accéder à la base de \nrecherche des accords commerciaux",
                                    themeColor:
                                        Color.fromRGBO(67, 90, 177, 1.0),
                                    rechercheHintText:
                                        "Chercher un accord commercial",
                                    hintTextLeft: "Pays",
                                    textFieldLeftValues: paysValues,
                                    hintTextRight: "Type d'accord",
                                    textFieldRightValues: typeValues,
                                    hintTextBottom: "Statut",
                                    textFieldBottomValues: statutValues,
                                    textFieldBottomIsShown: true,
                                  )),
                        );
                      },
                      color: Colors.white,
                    ),
                  ),
                  Text("Affichage de tout les éléments",
                      style: kTitleTextstyle),
                  SizedBox(height: 10),
                  AccordCard(
                    type: "INTERNATIONAL",
                    title: "SYSTÈME GÉNÉRALISÉ DE PRÉFÉRENCES",
                    dentre: "20/05/2020",
                    dsignature: "06/05/2012",
                    partiesCons: "Pays les moins avancés d'afrique",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  AccordCard(
                    type: "BILATÉRAL",
                    image: "assets/images/wash_hands.png",
                    title: "OFFRE MAROCAINE EN FAVEUR DES PMA D'AFRIQUE",
                    dentre: "07/07/2020",
                    dsignature: "06/03/2016",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  AccordCard(
                    type: "GROUPEMENT ÉCONOMIQUE",
                    image: "assets/images/wear_mask.png",
                    title:
                        "ACCORD ENTRE L'UNION EUROPÉENNE (UE) ET LE ROYAUME DU MAROC RELATIF AUX MESURES DE LIBÉRALISATION RÉCIPROQUES EN MATIÈRE DE PRODUITS AGRICOLES, DE PRODUITS AGRICOLES TRANSFORMÉS, DE POISSONS ET DE PRODUITS DE LA PÊCHE",
                    dentre: "20/05/2020",
                    dsignature: "06/05/2012",
                    partiesCons: "Pays les moins avancés d'afrique",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsAccord(
                                  titre:
                                      "ACCORD ENTRE L'UNION EUROPÉENNE (UE) ET LE ROYAUME DU MAROC RELATIF AUX MESURES DE LIBÉRALISATION RÉCIPROQUES EN MATIÈRE DE PRODUITS AGRICOLES, DE PRODUITS AGRICOLES TRANSFORMÉS, DE POISSONS ET DE PRODUITS DE LA PÊCHE",
                                  type: "Groupement économique",
                                  statut: "En vigueur",
                                  lien: "",
                                  partiesCons: "Union Européenne",
                                  dateApp: "2012",
                                  dateSignature: "2010-12-13",
                                  champApp:
                                      "Les dispositions de l’accord s’appliquent :"
                                      "aux produits agricoles, aux produits agricoles transformés, aux poissons et produits de la pêche originaires de la Communauté et importés au Maroc"
                                      "aux produits agricoles, aux produits agricoles transformés, aux poissons et produits de la pêche originaires du Maroc et exportés vers l’Union Européenne",
                                  regimePref:
                                      "Les avantages fiscaux et tarifaires prévus par les dispositions douanières de l’accord sont ci-après énumérés :"
                                      "A l’importation au Maroc"
                                      "Démantèlement du droit d’importation pour certains produits (Cf. liste 1 de l’annexe I) conformément au schéma ci-après :"
                                      "Groupe1 (G1) : Exonération du DI dès l’entrée en vigueur de l’Accord ;"
                                      "Groupe2 (G2) : Démantèlement du DI sur une période de 5 ans à raison de 20% par an ;"
                                      "Groupe3 (G3) : Démantèlement du DI sur une période de 10 ans à raison de 10% par an."
                                      "Réduction ou exonération tarifaires dans le cadre de contingents pour certains produits (Cf. liste 2 de l’annexe I). Hors contingents, les produits considérés bénéficient des taux préférentiels conformément aux schémas de démantèlement qui leur sont propres (G2 ou G3)."
                                      "Réductions tarifaires dans le cadre de contingents pour certains produits qui ne sont pas libéralisés et ne sont donc pas soumis au démantèlement tarifaire (Cf. liste 3 de l’annexe I). Hors contingents, ces produits sont soumis au DI dans le cadre du droit commun."
                                      "A l’exportation du Maroc vers l’Union Européenne"
                                      "Tous les produits sont libéralisés à l’exception de certains produits repris à la liste 1 de l’annexe II.",
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
                    type: "BILATÉRAL",
                    image: "assets/images/wash_hands.png",
                    title: "ACCORD DE LIBRE ÉCHANGE MAROC - TURQUIE",
                    dsignature: "4 juillet 2004",
                    dentre: " 1 janvier 2006",
                    partiesCons: "Turquie",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  AccordCard(
                    type: "INTERNATIONAL",
                    image: "assets/images/wear_mask.png",
                    title: "ACCORD DE LIBRE ÉCHANGE MAROC - USA",
                    dsignature: "15 juin 2004",
                    dentre: " 1 janvier 2006",
                    partiesCons: "Etats-Unis d'Amérique",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  AccordCard(
                    type: "MULTILATÉRAL",
                    image: "assets/images/wash_hands.png",
                    title:
                        "ACCORD DE LIBRE ÉCHANGE ENTRE LES PAYS ARABES MÉDITERRANÉENS (DÉCLARATION D’AGADIR)",
                    dsignature: "25 février 2004",
                    dentre: "27 mars 2007",
                    partiesCons: "Quad d'Agadir",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  AccordCard(
                    type: "BILATÉRAL",
                    image: "assets/images/wash_hands.png",
                    title:
                        "ACCORD CONCERNANT LE TRANSPORT ROUTIER INTERNATIONAL DE VOYAGEURS ET DE MARCHANDISES",
                    dsignature: "28 janvier 2003",
                    partiesCons: "Danemark",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  AccordCard(
                    type: "BILATÉRAL",
                    title: "ACCORD DE LIBRE ÉCHANGE MAROCO - EMIRATI",
                    dsignature: "25 juin 2001",
                    dentre: "7 septembre 2003",
                    partiesCons: "Emirats Arabes Unis",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  AccordCard(
                    type: "BILATÉRAL",
                    title: "ACCORD DE LIBRE ÉCHANGE MAROCO - TUNISIEN",
                    dsignature: "16 mars 1999",
                    dentre: " 16 mars 1999",
                    partiesCons: "Tunisie",
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

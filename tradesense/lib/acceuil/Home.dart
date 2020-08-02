import 'dart:convert';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:tradesense/entities/pays.dart';
import 'package:tradesense/entities/regime.dart';
import 'package:tradesense/acceuil/shCodeDialog.dart';
import 'package:http/http.dart' as http;
import 'package:tradesense/constant.dart';
import 'package:tradesense/menu/menu.dart';
import 'package:tradesense/mesure_sanitaire/MesureSanitaire.dart';
import 'package:tradesense/accords/accords.dart';
import 'package:tradesense/procedure/procedure.dart';
import 'package:tradesense/rechercheProduit/ListeRechercheProduit.dart';

class Home extends StatelessWidget {
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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();
  double offset = 0;

  static List<String> paysNames = new List<String>();
  var currentSelectedValue3;
  List<String> produitValues = [
    'produit 1',
    'produit 2',
    'produit 3',
    'produit 4',
    'produit 5',
    'produit 6'
  ];
  final paysSelected = TextEditingController();
  String countrySelect = "";
  var country_id;
  var produit_id;
  String selectPays = "";
  static List<Pays> pays = new List<Pays>();
  static List<Regime> regimes = new List<Regime>();
  static List<String> regimesNames = ["IMPORT", "EXPORT"];
  var selectRegime;
  String selectProduit;
  Map<String, String> r =
      Map.fromIterable(regimes, key: (v) => v.id, value: (v) => v.name);

// Cette fonction permet de charger les pays du site et les placer dans une liste des objets Pays
  static List<Pays> loadPays(String jsonString) {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed.map<Pays>((json) => Pays.fromJson(json)).toList();
  }

// Cette fonction permet d'extraire les données
// charger les Pays et les régimes et le produits
  Future getData() async {
    //  http.Response response1 =
    // await http.get("https://dev.tradesense.ma/api/tp/ps/1.0.0/regimes");
    http.Response response2 = await http
        .get("https://dev.tradesense.ma/api/tp/ps/1.0.0/zones?sort=%2Bname");

    if (response2.statusCode == 200) {
      pays = loadPays(response2.body);

      pays.forEach((element) {
        paysNames.add(element.name);
      });

      print('Pays : ${paysNames.length}');
    } else {
      print("something wrong");
    }
  }

  @override
  void initState() {
    getData();
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
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(67, 90, 177, 1.0),
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(67, 90, 177, 1.0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Ce Container contient le logo

                  Container(
                      height: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo2.PNG'),
                        ),
                      )),
                  SizedBox(height: 6),

                  // Ce container contient le titre
                  Center(
                    child: Text(
                      'Recherche d\'informations\ndes produits',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // on va effectuer la recherche produit dans un formulaire
                  // le formulaire est le widget appelé Form

                  Form(
                      child: Column(
                    children: <Widget>[
                      // Ce Container contient le champs régime

                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              hint: Text(
                                "Régime",
                              ),
                              value: selectRegime,
                              onChanged: (newValue) {
                                setState(() {
                                  selectRegime = newValue;
                                });
                                print(selectRegime);
                              },

                              // on utilise que les noms des régimes dans la liste d'items
                              items: regimesNames.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              iconSize: 40.0,
                              style: TextStyle(color: Colors.black),
                              isExpanded: true,
                            ),
                          ),
                        ),
                      ),

                      // Ce Container contient le champs pays

                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: DropDownField(
                          onValueChanged: (valeur) {
                            setState(() {
                              selectPays = valeur;
                            });
                          },
                          value: country_id,
                          required: false,
                          hintText: 'Pays',
                          items: paysNames,
                        ),
                      ),

                      // Ce container contient le champ de saisie du produit

                      Container(
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: DropDownField(
                          onValueChanged: (valeur2) {
                            setState(() {
                              selectProduit = valeur2;
                            });
                          },
                          value: produit_id,
                          required: false,
                          hintText: 'Nom ou code SH produit',
                          items: produitValues,
                        ),
                      ),

                      // Ce container contient le boutton affiche une dialog contient les informations
                      // du code Sh des produits

                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => ShCodeDialog(
                                title: "Qu\'est ce que le code SH? ",
                                description:
                                    "Le code SH est un code de reconnaissance internationale, Il est utilisé principalement"
                                    " dans l\'établissement de la nomenclature "
                                    "douanière nationale et la collecte des "
                                    "statistiques du commerce mondiale",
                                closeButton: "Fermer",
                                closeButtonRoute: "/home",
                              ),
                            );
                          },
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: Color.fromRGBO(67, 90, 177, 1.0),
                          child: Text(
                            'Qu\'est ce que le code SH?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      //SizedBox(height: 7),
                      //Cette row contient le boutton recherche

                      Row(
                        children: <Widget>[
                          SizedBox(width: 30.0),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              child: RaisedButton(
                                elevation: 5.0,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ListeRechercheProduit()),
                                  );
                                },
                                padding: EdgeInsets.all(5.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                color: Colors.amber,
                                child: Text(
                                  'Recherche',
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30.0),
                        ],
                      ),
                      SizedBox(height: 30.0),
                    ],
                  )),
                ],
              ),
            ),
            // dans cette widget (Center) on place les autres outils
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Autres outils',
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),

                    // Ce container contient la première ressource
                    // les accords commerciaux
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(67, 90, 177, 1.0),
                                Color.fromRGBO(128, 156, 233, 1.0)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white,
                            ),
                            child: Image.asset("assets/images/icon1.png"),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              Text(
                                "Accords commerciaux",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 19),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Accéder à la base de recherche \ndes accords commerciaux",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.0),
                              color: Colors.amber,
                            ),
                            child: RaisedButton(
                                elevation: 0.0,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Accords()),
                                  );
                                },
                                color: Colors.transparent),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Ce container contient la deuxième ressource
                    // les mesures sanitaires et phytosnitaires
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(67, 90, 177, 1.0),
                                Color.fromRGBO(128, 156, 233, 1.0)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white,
                            ),
                            child: Image.asset("assets/images/icon3.png"),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              Text(
                                "Mesures sanitaires\net phytosanitaires",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Accéder à la base de recherche des\n mesures sanitaires et phytosanitaires",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.0),
                              color: Colors.amber,
                            ),
                            child: RaisedButton(
                                elevation: 0.0,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MesureSanitaire()),
                                  );
                                },
                                color: Colors.transparent),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Ce container contient la troisième ressources
                    // le procédures
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(67, 90, 177, 1.0),
                                Color.fromRGBO(128, 156, 233, 1.0)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.white,
                            ),
                            child: Image.asset("assets/images/icon2.png"),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              Text(
                                "Procédures",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Accéder au référentiel \ndes procédures",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70.0),
                              color: Colors.amber,
                            ),
                            child: RaisedButton(
                                elevation: 0.0,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Procedure()),
                                  );
                                },
                                color: Colors.transparent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

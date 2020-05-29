
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradesense/menu/menu.dart';
import 'package:tradesense/rechercheProduit/ListeRechercheProduit.dart';
import 'shCodeDialog.dart';

import 'package:tradesense/CustomShapeClipper.dart';

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var currentSelectedValue;
  final regimeValues = ['IMPORT', 'EXPORT'];
  var currentSelectedValue2;
  final paysValues = ['pays 1', 'pays 2', 'pays 3'];
  var currentSelectedValue3;
  final produitValues = ['produit 1', 'produit 2', 'produit 3'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 500.0,
              color: Color.fromRGBO(67, 90, 177, 1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyDrawer();
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                  // Ce Container contient le logo
                  Container(
                      height: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo2.PNG'),
                        ),
                      )),
                  SizedBox(height: 30),

                  // Ce container contient le titre
                  Center(
                    
                    child: Text(
                      'Recherche d\'informations\ndes produits',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Cette Row contient les deux champs du régime et pays
                  Row(
                    children: <Widget>[
                      SizedBox(width: 30.0),
                      Expanded(
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  hint: Text(
                                    "Régime",
                                  ),
                                  value: currentSelectedValue,
                                  //isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      currentSelectedValue = newValue;
                                    });
                                    print(currentSelectedValue);
                                  },
                                  items: regimeValues.map((String value) {
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
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  hint: Text(
                                    "Pays",
                                  ),
                                  value: currentSelectedValue2,
                                  //isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      currentSelectedValue2 = newValue;
                                    });
                                    print(currentSelectedValue2);
                                  },
                                  items: paysValues.map((String value) {
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
                        ),
                      ),
                      SizedBox(width: 30.0),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Cette Row contient le champ de saisie du produit
                  Row(
                    children: <Widget>[
                      SizedBox(width: 30.0),
                      Expanded(
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  hint: Text(
                                    "Nom ou code SH du produit",
                                  ),
                                  value: currentSelectedValue3,
                                  //isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      currentSelectedValue3 = newValue;
                                    });
                                    print(currentSelectedValue3);
                                  },
                                  items: produitValues.map((String value) {
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
                        ),
                      ),
                      SizedBox(width: 30.0),
                    ],
                  ),
                  // Ce container contient le boutton concernant le code SH
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
                  SizedBox(height: 15),
                  //Cette row contient le boutton recherche
                  Row(
                    children: <Widget>[
                      SizedBox(width: 30.0),
                      Expanded(
                        child: Container(
                          
                          height: 50.0,
                          child: RaisedButton(
                            elevation: 5.0,
                            
                            onPressed: () {
                                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListeRechercheProduit()),
                            );
                          
                          },
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: Colors.amber,
                            child: Text(
                              'Recherche',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 30.0),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

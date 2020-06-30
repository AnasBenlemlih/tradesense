
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:tradesense/Classes/pays.dart';
import 'package:tradesense/Classes/regime.dart';

import 'package:tradesense/rechercheProduit/ListeRechercheProduit.dart';
import 'shCodeDialog.dart';

import 'package:tradesense/CustomShapeClipper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class topPart extends StatefulWidget {
  @override
  _topPartState createState() => _topPartState();
}

class _topPartState extends State<topPart> {
  var currentSelectedValue;
  var currentSelectedValue2;
  final paysValues = ['Maroc', 'France', 'Afrique du sud'];
  var currentSelectedValue3;
  final produitValues = ['produit 1', 'produit 2', 'produit 3'];
  final paysSelected = TextEditingController();
  String countrySelect = "";
  static List<Pays> pays= new List<Pays>();
  static List<Regime> regimes = new List<Regime>();
  
  

   
  static List<Pays> loadPays(String jsonString){
       final parsed=json.decode(jsonString).cast<Map<String, dynamic>>();
        return parsed.map<Pays>((json)=> Pays.fromJson(json)).toList();
  }
  static List<Regime> loadRegimes(String jsonString){
       final parsed=json.decode(jsonString).cast<Map<String, dynamic>>();
        return parsed.map<Regime>((json)=> Regime.fromJson(json)).toList();
  }  
   

   Future getData() async {
    
    http.Response response1= await http.get("https://dev.tradesense.ma/api/tp/ps/1.0.0/regimes");   
    http.Response response2= await http.get("https://dev.tradesense.ma/api/tp/ps/1.0.0/zones?sort=%2Bname");
       if(response1.statusCode==200 && response2.statusCode==200){

        
        pays = loadPays(response2.body);
        regimes = loadRegimes(response1.body);
    print('Pays : ${pays.length}');
     print('Régimes : ${regimes.length}');
     
       }else{
         print("something wrong");
       }
      

   }
  @override
  void initState() {
    //getRegime();
   getData();
   super.initState();
  
   }
  @override
  Widget build(BuildContext context) {
  
    
    return Stack(
     
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 450.0,
              color: Color.fromRGBO(67, 90, 177, 1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                //  SizedBox(height: 30), 
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
                  Form(child: 
                  Column(children: <Widget>[    
                  // Cette Row contient le champs régime
                  Row(
                    children: <Widget>[
                      SizedBox(width: 30.0),
                      Expanded(
                        child: Container(
                          height: 50.0,
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
                                  items: regimes.map((Regime value){
                                    return DropdownMenuItem<String>(
                                      value: value.name.toUpperCase(),
                                      child: Text(value.name.toUpperCase()),
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
                  SizedBox(height: 10),
                  // Cette Row contient le champs pays
                  Row(children: <Widget>[
                    SizedBox(width: 30.0), 
                    
                   Expanded(
                     child: 
                  Container(
                          height: 70.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white),
                          child:
                            DropDownField(

                               controller: paysSelected,
                               hintText: "Pays",
                               hintStyle: TextStyle(fontSize: 15) ,
                               enabled: true,
                               itemsVisibleInDropdown: 3,
                               items: paysValues,
                                 onValueChanged: (Value) {
                                    setState(() {
                                      countrySelect = Value;
                                    });
                                   
                                  },
                               
                            )                       
                        ),),
                         SizedBox(width: 30.0),
                        ],
                        ),
                            SizedBox(height: 10),
                  // this Row contains the  textfichamp de saisie du produit
                  Row(
                    children: <Widget>[
                      SizedBox(width: 30.0),
                      Expanded(
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white),
                          child:DropDownField(controller: paysSelected,
                          hintText: "Nom ou code SH produit",
                          hintStyle: TextStyle(fontSize: 15) ,

                            )
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
                                  builder: (context) => ListeRechercheProduit()),
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
                  ],)
                  )
                ],
              ),
            )),
      ],
    );
  }
}

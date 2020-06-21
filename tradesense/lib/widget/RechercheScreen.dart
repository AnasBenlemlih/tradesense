import 'package:flutter/material.dart';

import 'package:tradesense/rechercheProduit/ListeRechercheProduit.dart';

import '../CustomShapeClipper.dart';

class RechercheScreen extends StatefulWidget {


final String titre;
final String rechercheHintText;
final String hintTextLeft;
final String hintTextRight;
final String hintTextBottom;
final List<String> textFieldLeftValues;
final List<String> textFieldRightValues;
final List<String> textFieldBottomValues;
final bool textFieldBottomIsShown;
final themeColor;
final int previousScreen;

  const RechercheScreen({Key key, this.titre, 
  this.rechercheHintText, this.hintTextLeft,
   this.hintTextRight, this.hintTextBottom, 
   this.textFieldLeftValues, this.textFieldRightValues, 
   this.textFieldBottomValues, this.textFieldBottomIsShown,
    this.themeColor, this.previousScreen}) : super(key: key);
    
  @override
  _RechercheScreenState createState() => _RechercheScreenState();
}

class _RechercheScreenState extends State<RechercheScreen> {
    var currentSelectedValue2;
    var currentSelectedValue3;
    var currentSelectedValue4;

  @override
  Widget build(BuildContext context) {
     
    
    return Scaffold(
     body:  Container(
        child: SingleChildScrollView(
        child: Column(
       children: <Widget>[     
                  Stack(
               children: <Widget>[
                 ClipPath(
                 clipper: CustomShapeClipper(),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
              height: 250.0,
              color: widget.themeColor,
              child: Column(
                children: <Widget>[
                SizedBox(height: 10.0,),
                Container(
                  alignment: Alignment.topLeft,
                  child:  IconButton(icon: Icon(Icons.arrow_back_ios), 
                   alignment: Alignment.topLeft,
                   color: Colors.white,
                  onPressed: () {
                  Navigator.pop(context);
                  },
                         ), 
                ),
                SizedBox(height: 20.0,),
                Center(
                    child: Text(
                      widget.titre,
                      textDirection: TextDirection.ltr,
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,                     
                      ),
                    ),
                  ),
                ],          
              ),
                  ),
                 )
               ],
             ),
            SizedBox(height: 40),
            // cette Row contient le 1 er champs de saisie de la recherche 
            Row(
              children: <Widget>[
                SizedBox(width: 20.0),
                Expanded(child: 
                Container(
                height: 45.0,
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
	                        BoxShadow(
	                          color: widget.themeColor,
	                          blurRadius: 3.0,
	                          offset: Offset(0, 0)
	                        )
	                      ]
                ),
                 child:  TextField(
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: widget.rechercheHintText,
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ), 
                ),
                 ),
              SizedBox(width: 20.0),
              ],
            ),
           SizedBox(height: 20),
           // cette Row contient le 2ème et le 3éme champs de saisie de recherche
           Row (
          children: <Widget>[
            // le 2 ème champ  : 
           SizedBox(width: 20.0),
           Expanded(child: Container(
                 height: 45.0,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
	                        BoxShadow(
	                          color: widget.themeColor,
	                          blurRadius: 3.0,
	                          offset: Offset(0, 0)
	                        )
	                      ]
                ),
             child: Center(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  hint: Text(
                                    widget.hintTextLeft,
                                  ),
                                  value: currentSelectedValue2,
                                  onChanged: (newValue) {
                                    setState(() {
                                      currentSelectedValue2 = newValue;
                                    });
                                    print(currentSelectedValue2);
                                  },
                                  items: widget.textFieldLeftValues.map((String value) {
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

           )
           ),
           SizedBox(width: 20.0),
           //le 3 ème champ : 
              Expanded(child: Container(
               height: 45.0,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
	                        BoxShadow(
	                          color: widget.themeColor,
	                          blurRadius: 3.0,
	                          offset: Offset(0, 0)
	                        )
	                      ]
                ),
             child: Center(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  hint: Text(
                                    widget.hintTextRight,
                                  ),
                                  value: currentSelectedValue3,
                                  onChanged: (newValue) {
                                    setState(() {
                                      currentSelectedValue3 = newValue;
                                    });
                                    print(currentSelectedValue3);
                                  },
                                  items: widget.textFieldRightValues.map((String value) {
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
            ),),
           SizedBox(width: 20.0), 
          ],
           ),
           SizedBox(height: 20),

      // cette Row contient le 4 ème champ de saisie de recherche 
            Row(
              children: <Widget>[
              
                SizedBox(width: 20.0),
                Expanded ( 
                        child: 
                        widget.textFieldBottomIsShown == true ?
                   Container(
                height: 45.0,
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
	                        BoxShadow(
	                          color: widget.themeColor,
	                          blurRadius: 3.0,
	                          offset: Offset(0, 0)
	                        )
	                      ]
                ),
                 child: Center(
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  hint: Text(
                                    widget.hintTextBottom,
                                  ),
                                  value: currentSelectedValue4,
                                  onChanged: (newValue) {
                                    setState(() {
                                      currentSelectedValue4 = newValue;
                                    });
                                    print(currentSelectedValue4);
                                  },
                                  items: widget.textFieldBottomValues.map((String value) {
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
                ) : 
                 Container(
                   child: 
                    SizedBox(
                      height: 45.0,
                    ),                   
                 )

                 ),
              SizedBox(width: 20.0),
              ],
            ),
            
 SizedBox( height: 45.0,),

          // le boutton recherche 
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
                            //color: Colors.amber,
                            color: widget.themeColor,
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
        ),
      ),
     
    );
  }
  
}


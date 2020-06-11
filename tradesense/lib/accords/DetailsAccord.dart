import 'package:flutter/material.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/widget/TitleHeader.dart';

class DetailsAccord extends StatefulWidget {
  final String titre;
  final String partiesCons;
  final String type;
  final String statut;
  final String lien;
  final String dateApp;
  final String dateSignature;
  final String champApp;
  final String regimePref;
  final String autorisation;
  final String infosSuppl;
  final String conditionActroi;
  //final List<String> documents; 

  const DetailsAccord({Key key, this.titre, this.partiesCons, this.type, this.statut, this.lien, this.dateApp, this.dateSignature, this.champApp, this.regimePref, this.autorisation, this.infosSuppl, this.conditionActroi}) : super(key: key);

  @override
  _DetailsAccordScreenState createState() => _DetailsAccordScreenState();
}

class _DetailsAccordScreenState extends State<DetailsAccord> {
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
              titre: widget.titre,
              offset: offset,
              color1: 0xFF4056C6,
              color2: 0xFF4056C6,
              lien: "lien"
            ),
            SizedBox(height: 20.0),
            Text(
              'Informations de base',
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF4056C6),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //Center Row contents horizontally,
                children: <Widget>[
                  Text("Type d'accord : ${widget.type}"),
                  Text('Statut : ${widget.statut}'),
                ],
              ),
            ),
           SizedBox(height: 10),
           Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //Center Row contents horizontally,
                children: <Widget>[
                  Text("Date de signature : ${widget.dateSignature}"),
                  Text("Date d'application  : ${widget.dateApp}"),
                ],
              ),
            ),
           SizedBox(height: 10),
             Text("parties contractantes : ${widget.partiesCons}"),
            SizedBox(height: 20),
            Text(
              "Champs d'application",
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF4056C6),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Text('${widget.champApp}'),
            SizedBox(height: 20),
            Text(
              "Régime préférentiel",
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF4056C6),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Text('${widget.regimePref}'),
            SizedBox(height: 20),
            Text(
              "Autorisations",
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF4056C6),
                fontSize: 20.0,
              ),
            ),
           SizedBox(height: 20),
           Text('${widget.autorisation}'),  
           SizedBox(height: 20),
            Text(
              "Information supplémentaire",
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF4056C6),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Text('${widget.infosSuppl}'), 
            SizedBox(height: 20),
             Text(
              "Conditions d'actroi de préférences",
              style: kHeadingTextStyle.copyWith(
                color: Colors.black,
                fontSize: 20.0,
                
              ),  
            ),
           SizedBox(height: 20),
           Text('${widget.conditionActroi}',
           style: TextStyle(
             color: Colors.grey
           )), 
           SizedBox(height:30.0),
           Text(
              "Base juridique et documents liés",
              style: kHeadingTextStyle.copyWith(
                color: Colors.black,
                fontSize: 16.0,
                
              ),  
            ),
               Row(
                 children: <Widget>[
                   Icon(Icons.file_download),
                   Text("Offre marocaine en faveur des PMA d'Afrique"),
                 ],
               ),
                SizedBox(height: 30.0,),
          ],
        ),
      ),
    );
  }
}
   



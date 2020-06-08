import 'package:flutter/material.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/info_screen.dart';
import 'package:tradesense/widget/TitleHeader.dart';

class DetailsMesure extends StatefulWidget {
  final String titre;
  final String regime;
  final String zone;
  final String desc;
  final String titreEtablisement;
  final String adresse;
  final String tel;
  final String fax;
  final String ville;
  final String email;
  final String siteWeb;
  //final List<String> documents; 
  //final List<EtapeProc> etapeProc;

  const DetailsMesure(
      {Key key,
      this.titre,
      this.regime,
      this.zone,
      this.desc,
      this.titreEtablisement,
      this.adresse, this.tel, 
      //this.fax,
       this.ville, this.email, this.siteWeb, this.fax, })
      : super(key: key);

  @override
  _DetailsMesureScreenState createState() => _DetailsMesureScreenState();
}

class _DetailsMesureScreenState extends State<DetailsMesure> {
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
              color1: 0xFF36C12C,
              color2: 0xFF36C12C
            ),
            SizedBox(height: 20.0),
            Text(
              'INFORMATIONS DE BASE',
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF36C12C),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, //Center Row contents horizontally,
                children: <Widget>[
                  Text('RÉGIME : ${widget.regime}'),
                  Text('ZONE : ${widget.zone}'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'DESCRIPTION',
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF36C12C),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Text((()
                    {
                      if (widget.desc != null) {
                        return "${widget.desc}";
                      }
                      return "donnée indisponible";
                    }
                    )()
                  ),
            SizedBox(height: 20),
            Text(
              'ETABLISSEMENT',
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF36C12C),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Text(
                '${widget.titreEtablisement}',
                style: kHeadingTextStyle.copyWith(
                color: Color(0xFF36C12C),
                fontSize: 16.0,
                
              ),
              textDirection: TextDirection.ltr,
                ),
             SizedBox(height: 18),
             // adresse 
             Row(
               children: <Widget>[
                 SizedBox( width : 10.0),
                 Icon(Icons.home),
                 SizedBox( width: 5.0),
                  Text('Adresse :',
                 maxLines: 1,
                 ),
                   
                 SizedBox(width : 10.0),
                 Text('${widget.adresse}',
                 maxLines: 1,)

               ],
             ),
             SizedBox(height: 18),
             // tel 
               Row(
               children: <Widget>[
                 SizedBox( width : 10.0),
                 Icon(Icons.phone),
                 SizedBox( width: 5.0),
                 Text("Tél :"),
                 SizedBox(width : 10.0),
                 Text('${widget.tel}',
                 maxLines: 2,)

               ],
             ),
            SizedBox(height: 18),
            // ville 
               Row(
               children: <Widget>[
                 SizedBox( width : 10.0),
                 Icon(Icons.location_city),
                 SizedBox( width: 5.0),
                 Text("Ville :"),
                 SizedBox(width : 10.0),
                 Text('${widget.ville}',
                 maxLines: 2,)
               ],
             ),
            SizedBox(height: 18),
            // email 
             Row(
               children: <Widget>[
                 SizedBox( width : 10.0),
                 Icon(Icons.email),
                 SizedBox( width: 5.0),
                 Text("Email :"),
                 SizedBox(width : 10.0),
                 Text('${widget.email}',
                 maxLines: 2,)
               ],
             ),
             // email 
             SizedBox(height: 18),
             // fax
             Row(
               children: <Widget>[
                 SizedBox( width : 10.0),
                 Icon(Icons.phonelink),
                 SizedBox( width: 5.0),
                 Text("Fax :"),
                 SizedBox(width : 10.0),
                 Text('${widget.fax}',
                 maxLines: 2,)
               ],
             ),
             SizedBox(height: 18),
             // site web 
              Row(
               children: <Widget>[
                 SizedBox( width : 10.0),
                 Icon(Icons.web),
                 SizedBox( width: 5.0),
                 Text("Site web :"),
                 SizedBox(width : 10.0),
                 Text('${widget.siteWeb}',
                 maxLines: 2,)
               ],
             ),
            SizedBox(height: 20),
            Text(
              "DOCUMENTS REQUIS",
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFF36C12C),
                fontSize: 20.0,
              ),
            ),
           SizedBox(height: 10),
           DocumentCard(
             title: "AGREMENT POUR LES MEDICAMENTS" ,
            
           ),
            SizedBox(height: 20),
          
          ],
        ),
      ),
    );
  }
}
   



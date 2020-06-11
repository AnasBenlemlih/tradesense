import 'package:flutter/material.dart';
import 'package:tradesense/acceuil/acceuil.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/info_screen.dart';
import 'package:tradesense/widget/TitleHeader.dart';

class DetailsBarriere extends StatefulWidget {
  final String titre;
  final String regime; 
  final String titreEtablisement;
  final String desc;
  final String adresse;
  final String tel;
  final String fax;
  final String ville;
  final String email;
  final String siteWeb;
  

  const DetailsBarriere(
      {Key key,
      this.titre,
      this.regime,
      this.desc,
      this.titreEtablisement,
      this.adresse, this.tel, 
      this.fax,
       this.ville, this.email, this.siteWeb, })
      : super(key: key);

  @override
  _DetailsProcScreenState createState() => _DetailsProcScreenState();
}

class _DetailsProcScreenState extends State<DetailsBarriere> {
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
              color1: 0xFFFF8748,
              color2: 0xFFFF4848
            ),
            SizedBox(height: 20.0),
            Text(
              'INFORMATIONS DE BASE',
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFFFF8748),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Text(
               "RÉGIME : ${widget.regime}",
               
             ),
                  SizedBox(height: 20),
                  Text('ETABLISSEMENT : ${widget.titreEtablisement}'
                  ),
               
            SizedBox(height: 20),
            Text(
              'DESCRIPTION',
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFFFF8748),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Text('${widget.desc}'),
            SizedBox(height: 20),
            Text(
              "INFORMATION DE L'ÉTABLISSEMENT",
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFFFF8748),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Text(
                '${widget.titreEtablisement}',
                style: kHeadingTextStyle.copyWith(
                color: Color(0xFFFF8748),
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
             // fax
             Row(
               children: <Widget>[
                 SizedBox( width : 10.0),
                 Icon(Icons.phonelink),
                 SizedBox( width: 5.0),
                 Text("fax :"),
                 SizedBox(width : 10.0),
                 Text('${widget.fax}',
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
              "DOCUMENTS ET INFOMATIONS ASSOCIÉES",
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFFFF8748),
                fontSize: 16.0,
              ),
            ),
           SizedBox(height: 10),
           Text(
             "ATTESTATION DE CONFORMITE AUX NORMES",
              
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
           ),
           

          ],
        ),
      ),
    );
  }
}
   



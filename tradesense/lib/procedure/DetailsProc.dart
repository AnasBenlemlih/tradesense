import 'package:flutter/material.dart';
import 'package:tradesense/acceuil/acceuil.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/info_screen.dart';
import 'package:tradesense/widget/TitleHeader.dart';

class DetailsProc extends StatefulWidget {
  final String titre;
  final String regime;
  final String zone;
  final String desc;
  final String titreEtablisement;
  final String adresse;
  final String tel;
  //final String fax;
  final String ville;
  final String email;
  final String siteWeb;
  //final List<String> documents; 
  //final List<EtapeProc> etapeProc;

  const DetailsProc(
      {Key key,
      this.titre,
      this.regime,
      this.zone,
      this.desc,
      this.titreEtablisement,
      this.adresse, this.tel, 
      //this.fax,
       this.ville, this.email, this.siteWeb, })
      : super(key: key);

  @override
  _DetailsProcScreenState createState() => _DetailsProcScreenState();
}

class _DetailsProcScreenState extends State<DetailsProc> {
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
                color: Color(0xFFFF8748),
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20),
            Text('${widget.desc}'),
            SizedBox(height: 20),
            Text(
              'ETABLISSEMENTS',
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
              "DOCUMENTATION ASSOCIÉE",
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFFFF8748),
                fontSize: 16.0,
              ),
            ),
           SizedBox(height: 10),
           DocumentCard(
             title: "DÉCLARATION DÛMENT CACHETÉE" ,
            
           ), 

           DocumentCard(
             title: "FORMULAIRE ENGAGEMENT DE L’OPÉRATEUR " ,
             description: "original",
            
           ),
            Text(
              "ÉTAPES",
              style: kHeadingTextStyle.copyWith(
                color: Color(0xFFFF8748),
                fontSize: 26.0,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text(
                  'Étape 1 : Déposer la demande d\'agrément'),
              trailing: Icon(Icons.keyboard_arrow_right),
              subtitle: Text(
                  "Zone: Maroc Coût estimé: Donnée indisponible\nTemps de finalisation estimé: Max. 30 jours"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  DetailsProc(
                                  titre:
                                      " Déposer la demande d\'agrément",
                                  regime: "import/export",
                                  zone: "Maroc",
                                  desc:
                                      "Le service procède à une analyse sommaire du dossier sur"
                                      "  la base des éléments déclaratifs et des écritures de l’administration."
                                      " À la lumière des résultats de cette analyse et selon les cas de figure ci-après, "
                                      " une réponse est adressée à l’entreprise dans un délai maximum d’un mois :\n"
                                      " L’entreprise est éligible : elle sera invitée à engager la mission d’audit par un cabinet spécialisé de son choix, "
                                      " selon le référentiel établi à cet effet (Cf. rubrique audit) et informée, le cas échéant, des affaires contentieuses"
                                      " ou des comptes échus qu’il convient de régulariser avant la signature de la convention ;\n"
                                      " Le rapport d’audit doit être présenté dans un délai maximum de 6 mois à compter" 
                                      " de la date de notification du résultat de l’étude d’éligibilité; L’entreprise n’est pas éligible : elle sera informée du motif du rejet.",
                                titreEtablisement: "SYSTÈME BADR",
                                adresse: "Administration des douanes",
                                // il faut régler le cas ou l'adresse est un long text 
                                tel: "05 37 57 90 00",
                                ville: "rabat",
                                email: "-",
                                siteWeb: "http://www.mcinet.gov.ma" ,
                                  
                                )),
                      );
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text(
                  "Étape 2 : Déposer la demande d'abonnement au système BADR"),
              trailing: Icon(Icons.keyboard_arrow_right),
              subtitle: Text(
                  "Zone: Maroc Coût estimé: Donnée indisponible\nTemps de finalisation estimé: Durée non communiquée ou indisponible"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  DetailsProc(
                                  titre:
                                      "Déposer la demande d'abonnement au système BADR",
                                  regime: "import/export",
                                  zone: "Maroc",
                                  desc:
                                      "Le service procède à une analyse sommaire du dossier sur"
                                      "  la base des éléments déclaratifs et des écritures de l’administration."
                                      " À la lumière des résultats de cette analyse et selon les cas de figure ci-après, "
                                      " une réponse est adressée à l’entreprise dans un délai maximum d’un mois :\n"
                                      " L’entreprise est éligible : elle sera invitée à engager la mission d’audit par un cabinet spécialisé de son choix, "
                                      " selon le référentiel établi à cet effet (Cf. rubrique audit) et informée, le cas échéant, des affaires contentieuses"
                                      " ou des comptes échus qu’il convient de régulariser avant la signature de la convention ;\n"
                                      " Le rapport d’audit doit être présenté dans un délai maximum de 6 mois à compter" 
                                      " de la date de notification du résultat de l’étude d’éligibilité; L’entreprise n’est pas éligible : elle sera informée du motif du rejet.",
                                titreEtablisement: "SYSTÈME BADR",
                                adresse: "Administration des douanes",
                                // il faut régler le cas ou l'adresse est un long text 
                                tel: "05 37 57 90 00",
                                ville: "rabat",
                                email: "-",
                                siteWeb: "http://www.mcinet.gov.ma" ,
                                  
                                ),
                                
                ),);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Étape 3 : Obtenir les accès au système BADR'),
              trailing: Icon(Icons.keyboard_arrow_right),
              subtitle: Text(
                  "Zone: Maroc Coût estimé: Donnée indisponible\nTemps de finalisation estimé: Durée non communiquée ou indisponible"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcceuilScreen()
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
   



import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/info_screen.dart';
import 'package:tradesense/widget/my_header.dart';

class MesureSanitaire extends StatelessWidget {
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
      home: MesureSanitaireScreen(),
    );
  }
}

class MesureSanitaireScreen extends StatefulWidget {
  @override
  _MesureSanitaireScreenState createState() => _MesureSanitaireScreenState();
}

class _MesureSanitaireScreenState extends State<MesureSanitaireScreen> {
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
            MyHeader(
              image: "assets/images/aid.png",
              textTop: "MESURES \nSANITAIRES \nET \nPHYTOSANITAIRES",
              textBottom: "",
              offset: offset,
              color1: 0xFF36C12C,
              color2: 0xFF000000,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      "assets/icons/search2.svg",
                      width: 30.0,
                      color: Colors.green,
                    ),
                  ),
                  Text("Affichage de tout les éléments",
                      style: kTitleTextstyle),
                  SizedBox(height: 10),
                  ProcPreventCard(
                    title: "FOURNIR LA FACTURE DÛEMENT VISEE",
                    partiesCons: "Pays les moins avancés d'afrique",
                  ),
                  ProcPreventCard(
                    title: "DÉPOSER LA DEMANDE D'ABONNEMENT AU SERVICE PORTNET",
                  ),
                  ProcPreventCard(
                    title: "AUTORISER L'EMBARQUEMENT À L'EXPORTATION",
                    partiesCons: "Pays les moins avancés d'afrique",
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
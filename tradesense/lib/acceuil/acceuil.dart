import 'package:flutter/material.dart';
import 'package:tradesense/acceuil/topPartHome.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/info_screen.dart';
import 'package:tradesense/mesure_sanitaire/MesureSanintaire.dart';
import 'package:tradesense/accords/accords.dart';
import 'package:tradesense/procedure/procedure.dart';

class Acceuil extends StatelessWidget {
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
      home: AcceuilScreen(),
    );
  }
}

class AcceuilScreen extends StatefulWidget {
  @override
  _AcceuilScreenState createState() => _AcceuilScreenState();
}

class _AcceuilScreenState extends State<AcceuilScreen> {
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
            HomeScreenTopPart(),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/icon1.png",
                          title: "Accords\ncommerciaux",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Accords()),
                            );
                          },
                        ),
                        SymptomCard(
                          image: "assets/images/icon3.png",
                          title: "Mesures sanitaires\net phytosanitaires",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MesureSanitaire()),
                            );
                          },
                        ),
                        SymptomCard(
                          image: "assets/images/icon2.png",
                          title: "RÉFÉRENTIEL\n DES Procédures",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Procedure()),
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tradesense/acceuil/topPart.dart';
import 'package:tradesense/acceuil/topPartHome.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/info_screen.dart';
import 'package:tradesense/mesure_sanitaire/MesureSanitaire.dart';
import 'package:tradesense/accords/accords.dart';
import 'package:tradesense/procedure/procedure.dart';

import '../CustomListTitle.dart';

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
      resizeToAvoidBottomPadding: false ,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(67, 90, 177, 1.0),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Color.fromRGBO(67, 90, 177, 1.0),
                  Color.fromRGBO(67, 90, 177, 1.0)
                ])),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 15,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('TradeSense',style: TextStyle(color: Colors.white,fontSize: 20.0,),),
                      )
                    ],
                  ),
                )),
            CustomListTitle(Icons.home, 'Accueil', () => {}),
            CustomListTitle(Icons.history, 'Accualité', () => {}),
            CustomListTitle(Icons.perm_media, 'Media', () => {}),
            CustomListTitle(Icons.exit_to_app, 'Quitter', () => {})
          ],
        ),
      ),

      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
           // HomeScreenTopPart(),
           topPart(),
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
                        OptionCard(
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
                        OptionCard(
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
                        OptionCard(
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

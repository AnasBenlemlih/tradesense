import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/widget/my_header.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Get to know",
              textBottom: "About Covid-19.",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "Headache",
                          isActive: true,
                        ),
                        SymptomCard(
                          image: "assets/images/caugh.png",
                          title: "Caugh",
                        ),
                        SymptomCard(
                          image: "assets/images/fever.png",
                          title: "Fever",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Prevention", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text:
                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    image: "assets/images/wear_mask.png",
                    title: "Wear face mask",
                  ),
                  PreventCard(
                    text:
                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    image: "assets/images/wash_hands.png",
                    title: "Wash your hands",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final String dsignature;
  final String dentre;
  final String partiesCons;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
    this.dentre,
    this.dsignature,
    this.partiesCons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: 176,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 156,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 186,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      text,
                      style: kTitreTextstyle.copyWith(),
                    ),
                    SizedBox(height: 5),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text((() {
                      if (partiesCons != null) {
                        return "Parties contractantes : ${this.partiesCons}";
                      }

                      return "";
                    })()),
                    Text((() {
                      if (dsignature != null && dentre != null) {
                        return "Date de signature : ${this.dsignature} \nDate d'entrée en vigueur : ${this.dentre}";
                      }

                      return "";
                    })()),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  final Function onTap;

  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: InkWell(
            splashColor: Color.fromRGBO(67, 90, 177, 1.0),
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  isActive
                      ? BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 20,
                          color: kActiveShadowColor,
                        )
                      : BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 6,
                          color: kShadowColor,
                        ),
                ],
              ),
              child: Column(
                children: <Widget>[
                 Image.asset(image, height: 70),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            )
      ),
    );
  }
}

class ProcPreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  final String dsignature;
  final String dentre;
  final String partiesCons;
  const ProcPreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
    this.dentre,
    this.dsignature,
    this.partiesCons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: 146,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 116,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 156,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 5),
                    Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Zone: Maroc"),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SvgPicture.asset(
                        "assets/icons/forward.svg",
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreventCardd extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCardd({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                //la couleur du box qui contient l'option
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 10,
                    color: Colors.grey,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Image.asset(image),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 60),
                  FloatingActionButton(
                    backgroundColor: Colors.amberAccent,
                    onPressed: () {},
                    //  tooltip: 'Increment',
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradesense/constant.dart';

// la carte de l'élément accord commercial
class AccordCard extends StatelessWidget {
  final String image;
  final String title;
  final String type;
  final String dsignature;
  final String dentre;
  final String partiesCons;
  final Function onTap;
  const AccordCard({
    Key key,
    this.image,
    this.title,
    this.type,
    this.dentre,
    this.dsignature,
    this.partiesCons,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: 200,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 200,
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 230,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      type,
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
                      return "-";
                    })()),
                    Text((() {
                      if (dsignature != null) {
                        return "Date de signature: ${this.dsignature}";
                      }
                      return "Date de signature : - ";
                    })()),
                    Text((() {
                      if (dentre != null) {
                        return "Date d'entrée en vigueur : ${this.dentre}";
                      }

                      return "Date d'entrée en viguer : -";
                    })()),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                        elevation: 0.0,
                        child: SvgPicture.asset(
                          "assets/icons/forward.svg",
                          width: 10.0,
                          color: Colors.indigo,
                        ),
                        onPressed: onTap,
                        color: Colors.white,
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

// la carte d'option dans l'accueil
class OptionCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  final Function onTap;

  const OptionCard({
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
          )),
    );
  }
}

//la carte d'élément procédure
class ProcedureCard extends StatelessWidget {
  //final String image;
  final String title;
  final String zone;
  final String regime;
  final Function onTap;

  const ProcedureCard({
    Key key,
    this.title,
    this.onTap,
    this.zone,
    this.regime,
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
                height: 176,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //style: kTitreTextstyle.copyWith(),

                    Text((() {
                      if (regime != null) {
                        return "${this.regime}";
                      }
                      return "-";
                    })()),
                    SizedBox(height: 5),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text("Zone : ${this.zone}"),
                    //Text(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                        elevation: 0.0,
                        child: SvgPicture.asset(
                          "assets/icons/forward.svg",
                          width: 10.0,
                          color: Colors.orange,
                        ),
                        onPressed: onTap,
                        color: Colors.white,
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

// la carte d'élément mesures sanitaires et phytosanitaires
class MesureCard extends StatelessWidget {
  //final String image;
  final String title;
  final String zone;
  final String regime;
  final String etablissement;
  final int color;
  final Function onTap;

  const MesureCard({
    Key key,
    this.title,
    this.onTap,
    this.zone,
    this.regime,
    this.etablissement,
    this.color,
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
                height: 176,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //style: kTitreTextstyle.copyWith(),

                    Text((() {
                      if (regime != null) {
                        return "${this.regime}";
                      }
                      return "";
                    })()),
                    SizedBox(height: 5),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      etablissement,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),

                    Text("Zone : ${this.zone}"),
                    //Text(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                        elevation: 0.0,
                        child: SvgPicture.asset(
                          "assets/icons/forward.svg",
                          width: 10.0,
                          color: Colors.black,
                        ),
                        onPressed: onTap,
                        color: Colors.white,
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

class DocumentCard extends StatelessWidget {
  //final String image;
  final String title;
  final String description;

  const DocumentCard({
    Key key,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: SizedBox(
        height: 90,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("À fournir"),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text((() {
                      if (description != null) {
                        return "${this.description}";
                      }
                      return "";
                    })()),
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

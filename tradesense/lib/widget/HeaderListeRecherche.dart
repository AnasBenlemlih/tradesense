import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/menu/menu.dart';

class HeaderListeRecherche extends StatefulWidget {
  final String regime;
  final String pays;
  final String produit;
  final double offset;
  final int color2, color1;
  const HeaderListeRecherche(
      {Key key,
      this.regime,
      this.pays,
      this.produit,
      this.offset,
      this.color1,
      this.color2})
      : super(key: key);

  @override
  _HeaderListeRechercheState createState() => _HeaderListeRechercheState();
}

class _HeaderListeRechercheState extends State<HeaderListeRecherche> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperListeRecherche(),
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 30, right: 10),
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(widget.color1),
              Color(widget.color2),
            ],
          ),
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
       
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    
                    child: Text(
                      "${widget.regime} DEPUIS ${widget.pays} AU MAROC ",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 26.0,
                        
                      ),
                      
                    ),
                  ),
                  Positioned(
                    top: 90 - widget.offset / 2,
                    left: 30,
                    child: Text(
                      "--- ${widget.produit}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipperListeRecherche extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

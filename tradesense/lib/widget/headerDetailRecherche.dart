import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradesense/constant.dart';
import 'package:tradesense/menu/menu.dart';

class HeaderDetailRecherche extends StatefulWidget {
  final String textTop;
  final double offset;
  final int color2, color1;
  const HeaderDetailRecherche(
      {Key key, this.textTop, this.offset, this.color1, this.color2})
      : super(key: key);

  @override
  _HeaderDetailRechercheState createState() => _HeaderDetailRechercheState();
}

class _HeaderDetailRechercheState extends State<HeaderDetailRecherche> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipperDetails(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 10),
        height: 270,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyDrawer();
                    },
                  ),
                );
              },
              child: SvgPicture.asset("assets/icons/menu.svg"),
            ),
            Container(
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo2.PNG'),
                  ),
                )),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Text(
                      "${widget.textTop}",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 23.0,
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

class MyClipperDetails extends CustomClipper<Path> {
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

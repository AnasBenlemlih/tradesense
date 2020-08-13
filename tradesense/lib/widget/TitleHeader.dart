import 'package:flutter/material.dart';

import '../constant.dart';

class TitleHeader extends StatefulWidget {
  final String titre;
  final String lien;
  final double offset;
  final int color2, color1;
  final double size;

  const TitleHeader(
      {Key key,
      this.titre,
      this.offset,
      this.color2,
      this.color1,
      this.lien,
      this.size})
      : super(key: key);
  @override
  _TitleHeaderState createState() => _TitleHeaderState();
}

class _TitleHeaderState extends State<TitleHeader> {
  final controller = ScrollController();
  double offset = 0;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipperListeRecherche(),
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        height: widget.size != null ? widget.size : 250,
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
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                alignment: Alignment.topLeft,
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Text(
                      widget.titre,
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 26.0,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Center(
                    child: Text((() {
                      if (widget.lien != null) {
                        return "télécharger le document";
                      }
                      return "";
                    })()),
                  ),

                  // Container(), // I dont know why it can't work without container
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

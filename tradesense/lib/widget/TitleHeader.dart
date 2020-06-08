import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';
import '../menu/menu.dart';

class TitleHeader extends StatefulWidget {
final String titre;
final String lien;
  final double offset;
  final int color2, color1;

  const TitleHeader({Key key, this.titre, this.offset, this.color2, this.color1, this.lien}) : super(key: key);
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
        padding: EdgeInsets.only(left: 40, top: 50, right: 10),
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
                      
                    ),
                    
                  ),
                  Center(child: Text(
                    
                      ((              
                  )
                    {
                      if (widget.lien != null) {
                        return "télécharger le document";
                      }
                      return "";
                    }
                    )()
                  ),
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
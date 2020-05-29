import 'package:flutter/material.dart';


class CustomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final Path path= Path();
    path.lineTo(0.0, size.height);

    var firstEndpoint = Offset(size.width * .4, size.height - 40.0);
    var firstControlpoint = Offset(size.width * 0.20, size.height - 55.0);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy, firstEndpoint.dx, firstEndpoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 50.0);
    var secondControlpoint = Offset(size.width * .75, size.height - 10);
    path.quadraticBezierTo(secondControlpoint.dx, secondControlpoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

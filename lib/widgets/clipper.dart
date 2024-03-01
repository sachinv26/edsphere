import 'package:flutter/material.dart';

class Clip1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0,size.height);
    path.lineTo(size.width,size.height);
    path.quadraticBezierTo(size.width,0,0,0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}


class Clip2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width,0);
    path.lineTo(size.height,size.width);
    path.quadraticBezierTo(0,size.height,0,0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
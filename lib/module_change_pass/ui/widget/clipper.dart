import 'package:flutter/material.dart';

class Clipper extends StatefulWidget {
  final Widget child;
  Clipper({required Widget child}) : this.child = child;
  @override
  State<StatefulWidget> createState() => _ClipperState(child);
}

class _ClipperState extends State<Clipper> {
  final Widget child;
  _ClipperState(this.child);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClip(),
      child: child,
    );
  }
}

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.6);
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height * 0.6);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

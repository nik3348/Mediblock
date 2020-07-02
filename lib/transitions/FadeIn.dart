import 'package:flutter/material.dart';

class FadeIn extends StatelessWidget {
  FadeIn({Key key, @required this.child}) : super(key: key);
  final Widget child;

  // TODO: Add opacity animation
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 100, end: 0),
        duration: Duration(seconds: 1),
        builder: (BuildContext context, double size, Widget child) {
          return Transform.translate(
            offset: Offset(0, size),
            child: child,
          );
        },
        child: child);
  }
}

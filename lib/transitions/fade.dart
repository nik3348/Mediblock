import 'package:flutter/material.dart';

class MyFadeIn extends StatefulWidget {
  final Widget child;

  MyFadeIn({@required this.child});

  @override
  _MyFadeInState createState() => _MyFadeInState();
}

class _MyFadeInState extends State<MyFadeIn>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween(
      begin: 0.0,
      end: 10,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

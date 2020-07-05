import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum _AniProps { opacity, translateX }

class FadeIn extends StatelessWidget {
  FadeIn({Key key, @required this.child, this.delay}) : super(key: key);
  final Widget child;
  final double delay;

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..add(_AniProps.translateX, Tween(begin: 5.0, end: 0.0));

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay:
          Duration(milliseconds: delay == null ? 1000 : (1000 * delay).round()),
      duration: Duration(milliseconds: 400),
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: Offset(0, value.get(_AniProps.translateX)),
          child: child,
        ),
      ),
    );
  }
}

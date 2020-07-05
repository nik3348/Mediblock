import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum _AniProps { opacity, radius }

class ButtonPulse extends StatelessWidget {
  ButtonPulse(
      {Key key, @required this.child, this.startRadius, this.finishRadius})
      : super(key: key);
  final double startRadius;
  final double finishRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double beginRadius = startRadius == null ? 75 : startRadius;
    final double endRadius = finishRadius == null ? 100.0 : finishRadius;
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, Tween(begin: 1.0, end: 0.0))
      ..add(_AniProps.radius, Tween(begin: beginRadius, end: endRadius));

    return LoopAnimation<MultiTweenValues<_AniProps>>(
      duration: Duration(milliseconds: 1500),
      builder: (context, child, value) => Container(
        width: 100,
        height: 100,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: value.get(_AniProps.radius),
                  height: value.get(_AniProps.radius),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue
                          .withOpacity(value.get(_AniProps.opacity))),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  child: Container(
                    width: beginRadius,
                    height: beginRadius,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      child: child,
      tween: tween,
    );
  }
}

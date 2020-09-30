import 'package:flutter/material.dart';

enum TransitionType { SLIDE, SIZE }

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  TransitionType transitionType;

  CustomPageRoute(
      {WidgetBuilder builder, RouteSettings settings, this.transitionType})
      : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.name == '/') {
      return child;
    }

    if (transitionType == TransitionType.SIZE) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          sizeFactor: animation,
          child: child,
        ),
      );
    } else if (transitionType == TransitionType.SLIDE) {
      return SlideTransition(
        position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
    } else {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
  }
}

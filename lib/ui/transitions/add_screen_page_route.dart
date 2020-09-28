import 'package:flutter/material.dart';

class AddScreenPageRoute<T> extends MaterialPageRoute<T> {
  AddScreenPageRoute({WidgetBuilder builder, RouteSettings settings})
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

    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }
}

// A good article. Incase I need it later:
// https://medium.com/flutter-community/everything-you-need-to-know-about-flutter-page-route-transition-9ef5c1b32823

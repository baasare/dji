import 'package:dji/routes/routes.dart';
import 'package:dji/screens/general/splash_screen.dart';
import 'package:dji/screens/general/walkthrough_screen.dart';
import 'package:dji/screens/general/welcome_screen.dart';
import 'package:dji/screens/home/home_screen.dart';
import 'package:dji/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final Map<String, dynamic> arguments = settings.arguments;
  switch (settings.name) {
    case splashViewRoute:
      return PageTransition(
        child: SplashScreen(),
        type: PageTransitionType.fade,
      );
    case welcomeViewRoute:
      return PageTransition(
        child: WelcomeScreen(),
        type: PageTransitionType.fade,
      );
    case walkThroughViewRoute:
      return PageTransition(
        child: WalkThroughScreen(),
        type: PageTransitionType.fade,
      );

    case homeViewRoute:
      return PageTransition(
        child: HomeScreen(),
        type: PageTransitionType.fade,
      );

    case testViewRoute:
      return PageTransition(
        child: TestScreen(),
        type: PageTransitionType.fade,
      );

    default:
      return PageTransition(
        child: WelcomeScreen(),
        type: PageTransitionType.fade,
      );
  }
}

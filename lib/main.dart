import 'package:dji/routes/router.dart' as router;
import 'package:dji/routes/routes.dart';
import 'package:dji/utils/app_config.dart';
import 'package:dji/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // app name
      title: AppConfig.appName,

      // app theme
      theme: AppTheme.lightTheme,

      // disable test banner
      debugShowCheckedModeBanner: false,

      //make flutter aware of app routes using router generator in router.dart file
      onGenerateRoute: router.generateRoute,

      initialRoute: welcomeViewRoute,
    );
  }
}

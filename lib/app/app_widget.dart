import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie app',
      home: HomePage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/screens/home/home_screen.dart';
import 'app/screens/movie_details/detail_view.dart';
import 'app/shared/routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie app',
      theme: ThemeData(
        primaryColor: Color(0xFF020024),
        accentColor: Color(0xFF3f3e57),
      ),
      routes: {
        AppRoutes.HOME_PAGE: (context) => HomeScreen(),
        AppRoutes.MOVIE_DETAIL: (context) => MovieDetailsView(),
      },
    );
  }
}

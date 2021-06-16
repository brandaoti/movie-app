import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/app/pages/detail/detail_view.dart';
import 'package:movie_app/app/shared/routes/app_routes.dart';

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
      // home: HomePage(),
      routes: {
        AppRoutes.HOME_PAGE: (context) => HomePage(),
        AppRoutes.MOVIE_DETAIL: (context) => MovieDetailsView(),
      },
    );
  }
}

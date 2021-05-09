import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/components/loading_progress_component.dart';

import 'movie/movie_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Cubos Academy - Movie APP'),
      ),
      body: Column(
        children: [
          MovieView(),
          // LoadingCircularIndicator(),
        ],
      ),
    );
  }
}

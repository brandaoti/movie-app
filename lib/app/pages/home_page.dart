import 'package:flutter/material.dart';
import 'package:movie_app/app/pages/movie/movie_view.dart';
import 'package:movie_app/app/shared/components/back_poster_slider.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: Colors.grey[800],
        title: Text('Cubos Academy'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[700],
      body: SafeArea(
        child: Column(
          children: [
            Container(child: BackPosterSlider()),
            Expanded(
              child: ListView(
                children: [
                  MovieView(),
                  // MovieView(),
                  // MovieView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'movie/movie_view.dart';
import '../shared/components/back_poster_slider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubos Academy'),
        centerTitle: true,
        elevation: 0,
        brightness: Brightness.dark,
        // backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF020024),
                Color(0xFF48496a),
                Color(0xFF7f7f8c),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Column(
            children: [
              Container(child: BackPosterSlider()),
              Expanded(
                child: ListView(
                  children: [
                    MovieView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

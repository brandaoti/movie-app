import 'package:flutter/material.dart';

import '../../movie_upcoming/movie_upcoming.dart';
import '../../shared/components/movie_carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Cubos Academy'),
        leading: Container(
          margin: EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
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
                Color(0xFF1C1A44),
                Color(0xFF4E4C61),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Column(
            children: [
              Container(child: MovieCarouselSlider()),
              Expanded(
                child: ListView(
                  children: [
                    MovieUpcoming(),
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

import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

import '../../../data/models/movie.dart';
import '../../movie_upcoming/movie_upcoming_view_model.dart';
import 'cards/carousel_card_component.dart';
import 'loadings/loading_progress_component.dart';

class MovieCarouselSlider extends StatefulWidget {
  MovieCarouselSlider({Key key}) : super(key: key);

  @override
  _MovieCarouselSliderState createState() => _MovieCarouselSliderState();
}

class _MovieCarouselSliderState extends State<MovieCarouselSlider> {
  final _getUpcoming = UpcomingViewModel();
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _getUpcoming.loadMovie();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Movie>>(
      stream: _getUpcoming.stream,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:

          case ConnectionState.waiting:
            return Center(
              child: LoadingCircularIndicator(),
            );

          default:
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar Slider'),
              );
            } else {
              return Container(
                height: 280,
                child: PageIndicatorContainer(
                  align: IndicatorAlign.bottom,
                  indicatorColor: Colors.white,
                  indicatorSelectorColor: Colors.red,
                  indicatorSpace: 12.0,
                  length: snapshot.data.take(5).length,
                  shape: IndicatorShape.circle(size: 8.0),
                  padding: EdgeInsets.all(12.0),
                  //
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data.take(5).length,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data[index];

                      return CarouselCardComponent(
                        backPoster: movie.backdropPath,
                        title: movie.title,
                      );
                    },
                  ),
                ),
              );
            }
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/app/pages/movie/movie_controller.dart';
import 'package:movie_app/app/shared/components/cards/back_slider_card_component.dart';
import 'package:movie_app/app/shared/components/loadings/loading_progress_component.dart';
import 'package:movie_app/app/shared/models/movie.dart';
import 'package:movie_app/app/shared/models/movie_response.dart';
import 'package:page_indicator/page_indicator.dart';

class BackPosterSlider extends StatefulWidget {
  BackPosterSlider({Key key}) : super(key: key);

  @override
  _BackPosterSliderState createState() => _BackPosterSliderState();
}

class _BackPosterSliderState extends State<BackPosterSlider> {
  final _controller = MovieController();
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _controller.loadMovie();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
      stream: _controller.stream,
      builder: (BuildContext context, AsyncSnapshot<MovieResponse> snapshot) {
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
                  length: snapshot.data.movies.take(5).length,
                  shape: IndicatorShape.circle(size: 8.0),
                  padding: EdgeInsets.all(6.0),
                  //
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data.movies.take(5).length,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data.movies[index];

                      return BackPosterCardComponent(
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

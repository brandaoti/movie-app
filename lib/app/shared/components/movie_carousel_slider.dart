import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/routes/app_routes.dart';
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
    final _size = MediaQuery.of(context).size;

    return StreamBuilder<List<Movie>>(
      stream: _getUpcoming.stream,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return LoadingCircularIndicator();
        }

        if (snapshot.hasError) {
          return Center(
            child: LoadingErrorComponent(
              onPressed: () => _getUpcoming.toString(),
            ),
          );
        } else {
          return Container(
            height: _size.height * .45,
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

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.MOVIE_DETAIL,
                        arguments: movie.id,
                      );
                    },
                    child: CarouselCardComponent(
                      backPoster: movie.backdropPath,
                      title: movie.title,
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

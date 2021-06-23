import 'package:flutter/material.dart';

import '../../../data/models/movie.dart';
import '../shared/components/cards/movie_card_component.dart';
import '../shared/components/loadings/loading_progress_component.dart';
import '../shared/routes/app_routes.dart';
import 'movie_upcoming_view_model.dart';

class MovieUpcoming extends StatefulWidget {
  MovieUpcoming({Key key}) : super(key: key);

  @override
  _MovieUpcomingState createState() => _MovieUpcomingState();
}

class _MovieUpcomingState extends State<MovieUpcoming> {
  final _upcomingViewModel = UpcomingViewModel();

  @override
  void initState() {
    super.initState();
    _upcomingViewModel.loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Container(
      // height: 500,
      child: StreamBuilder<List<Movie>>(
        stream: _upcomingViewModel.stream,
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return LoadingCircularIndicator();
          }
          // * chamada de erro
          if (snapshot.hasError) {
            return LoadingErrorComponent(onPressed: () {
              setState(() {
                _upcomingViewModel.loadMovie();
              });
            });

            // * chamada da construção do layout com retorno da api
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 4.0),
                  child: Text(
                    'Upcoming',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: _size.height * .35,
                  width: _size.width,
                  // margin: EdgeInsets.symmetric(vertical: 8.0),

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data[index];

                      if (index == snapshot.data.length - 1) {
                        _upcomingViewModel.nextPage();
                      }

                      return MovieCardComponent(
                        posterPath: movie.posterPath,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.MOVIE_DETAIL,
                            arguments: movie.id,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

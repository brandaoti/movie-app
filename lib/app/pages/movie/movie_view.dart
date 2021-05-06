import 'package:flutter/material.dart';
import 'package:movie_app/app/pages/detail/detail_view.dart';
import 'package:movie_app/app/pages/movie/movie_controller.dart';
import 'package:movie_app/app/shared/components/movie_card_component.dart';

import '../home_page.dart';

class MovieView extends StatefulWidget {
  MovieView({Key key}) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final movieController = MovieController();

  @override
  void initState() {
    super.initState();
    movieController.loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      // height: 500,
      child: FutureBuilder(
        future: movieController.movie,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:

            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Text('Error');
              } else {
                return Container(
                  height: 280,
                  width: size.width,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  // //color: Colors.red, // Remover
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data[index];

                      return MovieCardComponent(
                        posterPath: 'https://image.tmdb.org/t/p/w300' +
                            movie.posterPath,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsView(movie),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

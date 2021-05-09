import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/components/loading_progress_component.dart';

import '../../shared/components/movie_card_component.dart';
import '../detail/detail_view.dart';
import 'movie_controller.dart';

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

            // * chamada de espera
            case ConnectionState.waiting:
              return LoadingCircularIndicator();

            default:
              // * chamada de erro
              if (snapshot.hasError) {
                return LoadingErrorComponent(onPressed: () {
                  setState(() {
                    movieController.loadMovie();
                  });
                });

                // * chamada da construção do layout com retorno da api
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

import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/components/loadings/loading_progress_component.dart';
import 'package:movie_app/app/shared/models/movie.dart';
import 'package:movie_app/app/shared/models/movie_response.dart';
import 'package:movie_app/app/shared/routes/app_routes.dart';

import '../../shared/components/cards/movie_card_component.dart';
import '../detail/detail_view.dart';
import 'movie_view_model.dart';

class MovieView extends StatefulWidget {
  MovieView({Key key}) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final _controller = ViewModel();

  @override
  void initState() {
    super.initState();
    _controller.loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      // height: 500,
      child: StreamBuilder<List<Movie>>(
        stream: _controller.stream,
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:

            // * chamada de espera
            case ConnectionState.waiting:
              return LoadingCircularIndicator();

            default:
              // * chamada de erro
              if (snapshot.hasError) {
                return LoadingErrorComponent(onPressed: () {
                  setState(() {
                    _controller.loadMovie();
                  });
                });

                // * chamada da construção do layout com retorno da api
              } else {
                return Container(
                  height: 280,
                  width: size.width,
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  //color: Colors.red, // Remover
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data[index];

                      if (index == snapshot.data.length - 1) {
                        _controller.nextPage();
                      }

                      return MovieCardComponent(
                        posterPath: movie.posterPath,
                        // instanciar nova foto
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.MOVIE_DETAIL,
                            arguments: movie,
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

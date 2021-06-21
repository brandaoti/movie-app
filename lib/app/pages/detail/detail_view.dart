import 'package:flutter/material.dart';
import 'package:movie_app/app/pages/detail/movie_detail_view_model.dart';
import '../../shared/models/movie.dart';

class MovieDetailsView extends StatelessWidget {
  final _viewModel = MovieDetailViewModel();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final movie = ModalRoute.of(context).settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF020024),
              Color(0xFF3f3e57),
              Color(0xFF7f7f8c),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, .5, 1.0],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Container para mostrar imagem
            Container(
                height: 500,
                width: size.width,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                    image: NetworkImage(movie.backdropPath),
                    fit: BoxFit.fill,
                  ),
                ),
                // * Container para add um gradient/efeito
                child: Container(
                  decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //     // colors: [
                      //     //   Color(0xFF303030),
                      //     //   // Color(0xFF303030).withOpacity(.5),
                      //     //   Color(0xFF303030).withOpacity(.1),
                      //     //   Colors.transparent,
                      //     // ],
                      //     // begin: Alignment.bottomCenter,
                      //     // end: Alignment.topCenter,
                      //     ),
                      ),
                )),

            // nome, data, descrição
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: size.width,
                          // color: Colors.red,
                          child: Text(movie.title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ))),
                      Column(
                        children: [
                          //!
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(4.0),
                                    margin: EdgeInsets.only(right: 12.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Colors.black.withOpacity(.5),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Release',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            letterSpacing: .5,
                                            wordSpacing: .5,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          movie.releaseDate,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            letterSpacing: 1,
                                            wordSpacing: .5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),

                                //
                                Container(
                                  color: Colors.black38,
                                  padding: EdgeInsets.all(4.0),
                                  child: Wrap(
                                    spacing: 10.0,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Score',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              letterSpacing: .5,
                                              wordSpacing: .5,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            movie.voteAverange.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              letterSpacing: 1,
                                              wordSpacing: .5,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // DATA
                                      // StreamBuilder<Map<String, Movie>>(
                                      //   stream: _viewModel.stream,
                                      //   initialData: {},
                                      //   builder: (context, snapshot) {
                                      //     if (snapshot.hasData) {
                                      //       return Text('${snapshot.data.length}');
                                      //     } else {
                                      //       return CircularProgressIndicator();
                                      //     }
                                      //   },
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              color: Colors.black38,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // TODO, fazer formatação do texto
                                  Text(
                                    movie.overview == '' ? 'Não tem descrição' : movie.overview,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      letterSpacing: 1.5,
                                      wordSpacing: 0.5,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: StreamBuilder<Map<String, Movie>>(
          stream: _viewModel.stream,
          initialData: {},
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FloatingActionButton(
                elevation: 0,
                child: Icon(
                  snapshot.data.containsKey(movie.id) ? Icons.star : Icons.star_border,
                  size: 36.0,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  _viewModel.toggleFavorite(movie);
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

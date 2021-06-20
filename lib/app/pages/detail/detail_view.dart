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
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Container para mostrar imagem
          Container(
              height: 500,
              width: size.width,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    // TODO, fazer o tratamento no modelo do parse
                    image: NetworkImage(
                      movie.backdropPath != null
                          ? 'https://image.tmdb.org/t/p/w300' + movie.posterPath
                          : 'https://raw.githubusercontent.com/brandaoti/image-repository/main/image-unavailable.png',
                      // Instanciar nova foto
                    )),
              ),
              // * Container para add um gradient/efeito
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF303030),
                      // Color(0xFF303030).withOpacity(.5),
                      Color(0xFF303030).withOpacity(.1),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              )),

          // nome, data, descrição
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                        width: size.width,
                        color: Colors.red,
                        child: Text(movie.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ))),

                    //!
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.red.withOpacity(.5),
                              ),
                              child: Column(
                                children: [
                                  Text('Lançamento'),
                                  Text(movie.releaseDate),
                                ],
                              )),

                          // Divider(color: Colors.red),
                          Container(
                            width: MediaQuery.of(context).size.width * .6,
                            margin: EdgeInsets.only(left: 30.0),
                            child: Wrap(
                              spacing: 10.0,
                              children: [
                                Text('Vote'),
                                StreamBuilder<Map<String, Movie>>(
                                  stream: _viewModel.stream,
                                  initialData: {},
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text('${snapshot.data.length}');
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Descrição',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        // TODO, fazer formatação do texto
                        Text(movie.overview),
                      ],
                    )),
                    //
                  ],
                ),
              ),
            ),
          ),
        ],
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

import 'package:flutter/material.dart';

import '../../shared/models/movie.dart';
import 'movie_detail_view_model.dart';

class MovieDetailsView extends StatefulWidget {
  @override
  _MovieDetailsViewState createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  final _detailViewModel = MovieDetailViewModel();

  IconData favorites;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final movieID = ModalRoute.of(context).settings.arguments as int;

    _detailViewModel.loadMovieDetail(movieID);

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
        child: StreamBuilder<MovieDetail>(
          stream: _detailViewModel.stream,
          builder: (context, snapshot) {
            var details = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.none:

              case ConnectionState.waiting:
                return Center(child: Text('Carregando'));

              default:
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // * Container para mostrar imagem
                      Container(
                          height: 500,
                          width: size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(details.posterPath),
                              fit: BoxFit.fill,
                            ),
                          ),
                          // * Container para add um gradient/efeito
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF020024).withOpacity(0.0),
                                  Color(0xFF3f3e57).withOpacity(.1),
                                  Color(0xFF4E4C61).withOpacity(1),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 0.9, 1.0],
                              ),
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
                                    child: Text(
                                      details.title,
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        color: Colors.white,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
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
                                                borderRadius: BorderRadius.circular(8.0),
                                                color: Colors.black.withOpacity(.7),
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
                                                    details.releaseDate,
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
                                            padding: EdgeInsets.all(4.0),
                                            margin: EdgeInsets.only(right: 12.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              color: Colors.black.withOpacity(.7),
                                            ),
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
                                                      details.voteAverange.toString(),
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
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: Colors.black.withOpacity(.05),
                                        ),
                                        child: Text(
                                          details.overview,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            letterSpacing: 1.5,
                                            wordSpacing: 0.5,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text('Erro ao carregar dados'));
                }
            }
          },
        ),
      ),

      //! FAB
      floatingActionButton: StreamBuilder<MovieDetail>(
          stream: _detailViewModel.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.white.withOpacity(.3),
                child: Icon(
                  snapshot.data.isFavorite != false ? Icons.favorite : Icons.favorite_border,
                  size: 36.0,
                  color: Colors.red[800],
                ),
                onPressed: () {
                  setState(() {
                    _detailViewModel.toggleFavorite(movieID);
                  });
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
// DATA

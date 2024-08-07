import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/components/loadings/loading_progress_component.dart';
import '../../../data/models/movie.dart';

import 'movie_detail_view_model.dart';

class MovieDetailScreen extends StatefulWidget {
  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final _detailViewModel = MovieDetailViewModel();

  IconData favorites;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    final _movieID = ModalRoute.of(context).settings.arguments as int;

    _detailViewModel.loadMovieDetail(_movieID);

    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   brightness: Brightness.dark,
      // ),
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

            if (snapshot.connectionState != ConnectionState.active) {
              return Center(
                child: LoadingCircularIndicator(),
              );
            }

            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Container para mostrar imagem
                  Stack(
                    children: [
                      Container(
                        height: _size.height * .6,
                        width: _size.width,
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
                                Color(0xFF3f3e70).withOpacity(0.0),
                                Color(0xFF4E4C61).withOpacity(1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 1.0, 1.0],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 30),
                          child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            splashColor: Colors.pinkAccent,
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.pinkAccent,
                              size: 38.0,
                            ),
                            tooltip: 'Voltar para tela anterior',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Pop home

                  // nome, data, descrição
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: _size.width,
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
                                            color: Colors.black26,
                                          ),
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.date_range_outlined,
                                                color: Colors.white,
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
                                          color: Colors.black26,
                                        ),
                                        child: Wrap(
                                          spacing: 10.0,
                                          children: [
                                            Column(
                                              children: [
                                                Icon(
                                                  Icons.star_half_sharp,
                                                  color: Colors.white,
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
          },
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,

      //! FAB
      floatingActionButton: StreamBuilder<MovieDetail>(
          stream: _detailViewModel.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.transparent,
                splashColor: Colors.red[800],
                child: Icon(
                    snapshot.data.isFavorite != false ? Icons.favorite : Icons.favorite_border,
                    size: 36.0,
                    color: Colors.red[800]),
                tooltip: 'Adicionar aos favoritos',
                onPressed: () {
                  setState(() {
                    _detailViewModel.toggleFavorite(_movieID);
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

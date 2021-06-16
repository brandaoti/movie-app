import 'package:flutter/material.dart';
import '../../shared/models/movie.dart';

class MovieDetailsView extends StatelessWidget {
  // final Movie movie;

  const MovieDetailsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final movie = ModalRoute.of(context).settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title != null ? Text(movie.title) : ''),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Container para mostrar imagem
          Container(
              height: 400,
              width: size.width,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.cover,
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
                      Color(0xFF303030).withOpacity(.5),
                      Color(0xFF303030).withOpacity(.1),
                      Colors.transparent,
                    ],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                  ),
                ),
              )),
          Container(
              // height: 100,
              width: size.width,
              // color: Colors.red,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(movie.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Column(children: [
                    Text('Lançamento'),
                    Text(movie.releaseDate),
                  ]),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
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
                Text(movie.overview),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

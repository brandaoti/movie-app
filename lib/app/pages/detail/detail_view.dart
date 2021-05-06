import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/models/movie.dart';

class MovieDetailsView extends StatelessWidget {
  final Movie movie;

  const MovieDetailsView(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
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
                color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w300' + movie.posterPath,
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
            child: Text(
              movie.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

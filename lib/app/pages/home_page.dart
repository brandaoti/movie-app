import 'package:flutter/material.dart';
import 'package:movie_app/app/movie_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Movie APP'),
      ),
      body: FutureBuilder(
        // future: future.call,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            height: 280,
            width: size.width,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.red, // Remover
            child: MoviePosterComponent(),
          );
        },
      ),
    );
  }
}

class MoviePosterComponent extends StatelessWidget {
  MoviePosterComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: moviesList.length,
      itemBuilder: (context, index) {
        var movie = moviesList[index];
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 280,
            maxHeight: 280,
            maxWidth: size.width * .45,
            minWidth: size.width * .45,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(.6),
              image: DecorationImage(
                image: AssetImage(movie.poster),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.8),
                    blurRadius: 3,
                    spreadRadius: 3,
                    offset: Offset(0, 0)),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/app/movie_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie APP'),
      ),
      body: FutureBuilder(
        // future: future.call,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            height: 200,
            width: size.width,
            color: Colors.green,
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
    return ListView.builder(
      itemCount: moviesList.length,
      itemBuilder: (context, index) {
        var movie = moviesList[index];
        return Column(
          children: [
            Image.asset(movie.poster),
          ],
        );
      },
    );
  }
}

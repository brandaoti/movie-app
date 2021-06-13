import 'dart:async';

import '../../shared/models/movie.dart';
import 'movie_model.dart';

class MovieController {
  final movieModel = MovieModel();

  StreamController<List<Movie>> _streamController = StreamController();

  get stream => _streamController.stream;

  // Future<List<Movie>> get movie {
  //   return movieModel.movies;
  // }

  loadMovie() {
    movieModel.getMovie().then((value) {
      _streamController.add(value);
    });
  }
}

import 'dart:async';

import 'package:movie_app/app/shared/models/movie_response.dart';
import 'movie_model.dart';

class MovieController {
  final _model = MovieModel();

  StreamController<MovieResponse> _streamController = StreamController();

  get stream => _streamController.stream;

  // Future<List<Movie>> get movie {
  //   return movieModel.movies;
  // }

  loadMovie() {
    // _model.movies.then((value) {
    //   _streamController.add(value);
    // });
    _model.getMovie().then((value) {
      _streamController.add(value);
    });
  }
}

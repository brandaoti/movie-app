import 'dart:async';

import '../../../data/models/movie.dart';

import 'movie_model.dart';

class ViewModel {
  final _model = MovieModel();

  StreamController<List<Movie>> _streamController = StreamController.broadcast();
  List<Movie> movieList = [];

  int _page = 1;

  get stream => _streamController.stream;

  loadMovie() {
    _model.getMovie(_page).then((value) {
      movieList.addAll(value.movies);
      _streamController.add(movieList);
    });
  }

  nextPage() {
    _page++;
    loadMovie();
  }
}

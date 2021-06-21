import 'dart:async';
import 'dart:convert';

import 'package:movie_app/app/shared/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'movie_model.dart';

class ViewModel {
  final _model = MovieModel();

  StreamController<List<Movie>> _streamController = StreamController();
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

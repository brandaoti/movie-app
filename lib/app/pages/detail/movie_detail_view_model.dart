import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/app/pages/detail/movie_detail_model.dart';
import 'package:movie_app/app/shared/models/movie.dart';
import 'package:movie_app/app/shared/storage/internal_storage.dart';
import 'package:movie_app/app/shared/storage/secure_storage.dart';
import 'package:movie_app/app/shared/storage/shared_preferences.dart';

class MovieDetailViewModel {
  final _detailModel = MovieDetailModel();

  StreamController<MovieDetail> _streamController = StreamController.broadcast();
  InternalStorageAdapter internalStorage;

  MovieDetailViewModel({
    InternalStorageAdapter adapter,
  }) : internalStorage = adapter ?? SecureStorage();

  get stream => _streamController.stream;

  String newFavoriteInstance;
  IconData favorite;

  toggleFavorite(int id) {
    favorite = newFavoriteInstance != null ? Icons.favorite : Icons.favorite_border;

    if (favorite == Icons.favorite_border) {
      saveFavorite(id);
    } else {
      removeFavorite(id);
    }
  }

  loadMovieDetail(int id) {
    _detailModel.getLoadMovieDetail(id);
    _detailModel.movieDetail.then((value) async {
      newFavoriteInstance = await getFavoriteMovie(value.id);
      value.isFavorite = newFavoriteInstance != null;
      _streamController.add(value);
    });
  }

  Future<String> getFavoriteMovie(int id) async {
    return await internalStorage.getFavoriteMovie(id);
  }

  saveFavorite(int id) {
    internalStorage.saveFavorite(id);
  }

  void removeFavorite(int id) {
    internalStorage.removeFavorite(id);
  }

  void dispose() {
    _streamController.close();
  }
}

// Map<String, Movie> _favorites = {};

// final StreamController<Map<String, Movie>> _favoriteController = StreamController.broadcast();

// Stream<Map<String, Movie>> get favStream => _favoriteController.stream;

// final _prefs = SharedPreferences.getInstance();

// MovieDetailViewModel() {
//   SharedPreferences.getInstance().then((prefs) {
//     // prefs.clear();
//     if (prefs.getKeys().contains("favorites")) {
//       _favorites = json.decode(prefs.getString("favorites")).map((key, value) {
//         return MapEntry(key, Movie.fromJson(value));
//       }).cast<String, Movie>();
//     }
//   });

//   _favoriteController.add(_favorites);
// }

// void toggleFavorite(Movie movie) {
//   if (_favorites.containsKey(movie.id)) {
//     _favorites.remove(movie.id);
//   } else {
//     _favorites[movie.id.toString()] = movie;
//   }
//   _favoriteController.sink.add(_favorites);

//   // _saveFavorite();
//   print(_favorites);
// }

// void _saveFavorite() async {
//   // final internal = await _prefs;
//   SharedPreferences.getInstance().then((prefs) {
//     prefs.setString("favorites", json.encode(_favorites));
//   });
// }

// void _deleteFavorite(int id) async {
//   await SharedPreferences.getInstance().then((value) {
//     value.remove(id.toString());
//   });
// }

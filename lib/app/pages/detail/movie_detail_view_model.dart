import 'dart:async';
import 'dart:convert';

import 'package:movie_app/app/shared/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieDetailViewModel {
  Map<String, Movie> _favorites = {};

  final StreamController<Map<String, Movie>> _favoriteController = StreamController.broadcast();

  Stream<Map<String, Movie>> get favStream => _favoriteController.stream;

  final _prefs = SharedPreferences.getInstance();

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

  void toggleFavorite(Movie movie) {
    if (_favorites.containsKey(movie.id)) {
      _favorites.remove(movie.id);
    } else {
      _favorites[movie.id.toString()] = movie;
    }
    _favoriteController.sink.add(_favorites);

    // _saveFavorite();
    print(_favorites);
  }

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

  dispose() {
    _favoriteController.close();
  }
}

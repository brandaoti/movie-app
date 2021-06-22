import 'dart:convert';

import 'package:movie_app/app/shared/models/movie.dart';
import 'package:movie_app/app/shared/storage/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends InternalStorageAdapter {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void toggleFavorite(Movie movie) {
    // if (favoriteMovies.contains(movie.id)) {
    //   removeFavorite(movie.id);
    // } else {
    //   saveFavorite(movie.id);
    // }
  }

  @override
  Future<String> getFavoriteMovie(int id) async {
    final internal = await _prefs;
    return internal.getString(id.toString());
  }

  @override
  removeFavorite(int id) async {
    final internal = await _prefs;
    internal.remove(id.toString());
    print('$id Deletado');
  }

  @override
  saveFavorite(int id) async {
    final internal = await _prefs;
    internal.setString("id", id.toString());
    print('$id Salvo');
  }
}

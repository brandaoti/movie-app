import 'dart:convert';

import 'package:movie_app/app/shared/models/movie.dart';
import 'package:movie_app/app/shared/storage/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends InternalStorageAdapter {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<String> favoriteMovies = [];
  bool isFavorite = false;

  @override
  void toggleFavorite(Movie movie) {
    // if (favoriteMovies.contains(movie.id)) {
    //   removeFavorite(movie.id);
    // } else {
    //   saveFavorite(movie.id);
    // }
    print('SS');
  }

  @override
  Future<void> saveFavorite(int id, Map<String, dynamic> json) async {
    final internal = await _prefs;
    final response = jsonEncode(json);
    await internal.setString('$id', response);
    print('Salvo');
  }

  @override
  Future<void> removeFavorite(int id) async {
    final internal = await _prefs;
    await internal.remove('$id');
    print('Removido');
  }
}

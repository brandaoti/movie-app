import 'package:movie_app/app/shared/models/movie.dart';
import 'package:movie_app/app/shared/storage/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends InternalStorageAdapter {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<String> favoriteMovies = [];
  bool isFavorite = false;

  @override
  void toggleFavorite(Movie movie) {
    if (favoriteMovies.contains(movie.id)) {
      favoriteMovies.remove(movie.id);
      isFavorite = false;
    } else {
      favoriteMovies.add(movie.id.toString());
      isFavorite = true;
    }

    print(isFavorite);
    print(favoriteMovies);
    saveFavorite(movie.id.toString());
  }

  @override
  void saveFavorite(String id) async {
    final internal = await _prefs;

    favoriteMovies = internal.getStringList('favorites');

    if (favoriteMovies == null) {
      favoriteMovies = [];
    }
    favoriteMovies.add(id);

    internal.setString('favorites', id.toString());
  }

  @override
  void removeFavorite(String id) {}

  // @override
  // void onSaveFavoriteMovie(String id) async {
  //   final internalPrefs = await _prefs;

  //   favoriteMovies = internalPrefs.getStringList('favorites');

  //   if (favoriteMovies == null) {
  //     favoriteMovies = [];
  //   }
  //   favoriteMovies.add(id);

  //   internalPrefs.setStringList('favorites', favoriteMovies);

  //   print('ID $favoriteMovies');
  // }
}

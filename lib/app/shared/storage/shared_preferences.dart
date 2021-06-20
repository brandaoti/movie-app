import 'package:movie_app/app/shared/storage/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends InternalStorageAdapter {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<String> favoriteMovies = [];
  bool isFavorite = false;

  @override
  void onSaveFavoriteMovie(String id) async {
    final internalPrefs = await _prefs;

    favoriteMovies = internalPrefs.getStringList('favorites');

    if (favoriteMovies == null) {
      favoriteMovies = [];
    }
    favoriteMovies.add(id);

    internalPrefs.setStringList('favorites', favoriteMovies);

    print('ID $favoriteMovies');
  }

  @override
  void onRemoveFavoriteMovie(String id) async {
    final internalPrefs = await _prefs;

    // internalPrefs.getStringList(id);

    favoriteMovies.remove(id);
  }

  @override
  void onFavorite() {}
}

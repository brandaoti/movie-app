import 'package:movie_app/app/shared/storage/internal_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter extends InternalStorageAdapter {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onSaveFavorite(int id) async {
    final internalPrefs = await _prefs;
    internalPrefs.setInt('id', id);
  }

  @override
  void onRemoveFavorite(int id) {}
}

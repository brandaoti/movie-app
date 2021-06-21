import 'package:movie_app/app/shared/models/movie.dart';

abstract class InternalStorageAdapter {
  void toggleFavorite(Movie movie);

  Future<void> saveFavorite(int id, Map<String, dynamic> json);

  Future<void> removeFavorite(int id);
}

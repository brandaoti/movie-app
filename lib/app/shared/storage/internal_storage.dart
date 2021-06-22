import 'package:movie_app/app/shared/models/movie.dart';

abstract class InternalStorageAdapter {
  void toggleFavorite(Movie movie);

  saveFavorite(int id);

  removeFavorite(int id);

  Future<String> getFavoriteMovie(int id);
}

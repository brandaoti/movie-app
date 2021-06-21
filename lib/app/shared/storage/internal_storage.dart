import 'package:movie_app/app/shared/models/movie.dart';

abstract class InternalStorageAdapter {
  void toggleFavorite(Movie movie);

  void saveFavorite(String id);

  void removeFavorite(String id);
}

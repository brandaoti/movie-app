abstract class InternalStorageAdapter {
  void toggleFavorite(int movieID);

  saveFavorite(int id);

  removeFavorite(int id);

  Future<String> getFavoriteMovie(int id);
}

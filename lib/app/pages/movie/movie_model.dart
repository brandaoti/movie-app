import 'package:movie_app/app/shared/models/movie_response.dart';
import 'package:movie_app/app/shared/storage/internal_storage.dart';
import 'package:movie_app/app/shared/storage/shared_preferences.dart';
import '../../shared/repository/api/repository_api.dart';

class MovieModel {
  final RepositoryApi repositoryApi;
  Future<MovieResponse> movies; // Variavel para Unit test

  InternalStorageAdapter internalStorage;

  MovieModel({
    this.repositoryApi = const RepositoryApi(),
    InternalStorageAdapter adapter,
  }) : internalStorage = adapter ?? SharedPreferencesAdapter();

  Future<MovieResponse> getMovie(int page) {
    return movies = repositoryApi.fetchMovie(page);
  }

  // saveMovie(String id) {
  //   internalStorage.onSaveFavoriteMovie(id);
  // }

  // removeMovie(String id) {
  //   internalStorage.onRemoveFavoriteMovie(id);
  // }
}

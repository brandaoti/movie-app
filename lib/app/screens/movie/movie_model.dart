import '../../../data/models/movie_response.dart';
import '../../../data/repositories/repository_api.dart';
import '../../../data/storage/internal_storage.dart';
import '../../../data/storage/shared_preferences.dart';

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
}

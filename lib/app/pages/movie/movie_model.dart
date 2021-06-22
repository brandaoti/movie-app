import 'package:movie_app/app/shared/models/movie.dart';
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

  // saveMovie(int id, Movie movie) {
  //   internalStorage.saveFavorite(id, movie.toJson());
  // }

  // removeMovie(int id) async {
  //   await internalStorage.removeFavorite(id);
  // }
}

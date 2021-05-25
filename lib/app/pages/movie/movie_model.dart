import '../../shared/models/movie.dart';
import '../../shared/repository/api/repository_api.dart';

class MovieModel {
  final RepositoryApi repositoryApi;
  Future<List<Movie>> movies;

  MovieModel({this.repositoryApi = const RepositoryApi()});

  getMovie() {
    movies = repositoryApi.fetchMovie();
  }
}

import '../../shared/models/movie.dart';
import '../../shared/repository/api/repository_api.dart';

class MovieModel {
  final _repositoryApi = RepositoryApi();

  Future<List<Movie>> movies;

  getMovie() {
    return movies = _repositoryApi.fetchMovie();
  }
}

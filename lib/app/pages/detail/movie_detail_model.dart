import '../../shared/models/movie.dart';
import '../../shared/repository/api/repository_api.dart';

class MovieDetailModel {
  final _repositoryApi = RepositoryApi();

  Future<MovieDetail> _movieDetail;

  Future<MovieDetail> get movieDetail => _movieDetail;

  getLoadMovieDetail(int id) {
    return _movieDetail = _repositoryApi.fetchMovieDetail(id);
  }
}

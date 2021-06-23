import '../../../data/models/movie.dart';
import '../../../data/repositories/repository_api.dart';

class MovieDetailModel {
  final _repositoryApi = RepositoryApi();

  Future<MovieDetail> _movieDetail;

  Future<MovieDetail> get movieDetail => _movieDetail;

  getLoadMovieDetail(int id) {
    return _movieDetail = _repositoryApi.fetchMovieDetail(id);
  }
}

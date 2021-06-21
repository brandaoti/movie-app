import 'package:movie_app/app/shared/models/movie.dart';
import 'package:movie_app/app/shared/repository/api/repository_api.dart';

class MovieDetailModel {
  final _repositoryApi = RepositoryApi();

  Future<MovieDetail> movieDetail;

  loadMovieDetail(int id) {
    movieDetail = _repositoryApi.fetchMovieDetail(id);
  }
}

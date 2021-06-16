import 'package:movie_app/app/shared/models/movie_response.dart';
import '../../shared/repository/api/repository_api.dart';

class MovieModel {
  final RepositoryApi repositoryApi;
  Future<MovieResponse> movies; // Variavel para Unit test

  MovieModel({this.repositoryApi = const RepositoryApi()});

  Future<MovieResponse> getMovie(int page) {
    return movies = repositoryApi.fetchMovie(page);
  }
}

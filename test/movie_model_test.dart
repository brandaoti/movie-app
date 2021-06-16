import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/app/pages/movie/movie_model.dart';
import 'package:movie_app/app/shared/models/movie.dart';
import 'package:movie_app/app/shared/models/movie_response.dart';
import 'package:movie_app/app/shared/repository/api/repository_api.dart';

void main() {
  test('FecthMovie, testa o valor da variavel movie', () {
    //
    final model = MovieModel(repositoryApi: MokeAPI());
    final page = 0;
    model.getMovie(page);

    expect(model.movies, completion(isNotNull));

    model.movies.then((item) {
      expect(item.movies[0].title, 'Mortal Kombat');
    });
  });
}

class MokeAPI extends RepositoryApi {
  @override
  Future<MovieResponse> fetchMovie(page) {
    final temp = Movie(
      title: 'Mortal Kombat',
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
    );

    final movie = MovieResponse(movies: [temp]);

    return Future.value(movie);
  }
}

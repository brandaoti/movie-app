import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/app/pages/movie/movie_model.dart';
import 'package:movie_app/app/shared/models/movie.dart';
import 'package:movie_app/app/shared/repository/api/repository_api.dart';

void main() {
  test('FecthMovie, testa o valor da variavel movie', () {
    //
    final model = MovieModel(repositoryApi: MokeAPI());

    model.getMovie();

    expect(model.movies, completion(isNotNull));

    model.movies.then((movies) {
      expect(movies[1].title, 'Mortal Kombat');
    });
  });
}

class MokeAPI extends RepositoryApi {
  @override
  Future<List<Movie>> fetchMovie() {
    final movie = [
      Movie(
        title: 'Godzilla vs. Kong',
        posterPath: 'posterPath',
        releaseDate: 'releaseDate',
      ),
      Movie(
        title: 'Mortal Kombat',
        posterPath: 'posterPath',
        releaseDate: 'releaseDate',
      ),
    ];

    return Future.value(movie);
  }
}

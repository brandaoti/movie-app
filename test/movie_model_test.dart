import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/app/pages/movie/movie_model.dart';

void main() {
  test('FecthMovie, testar o valor da variavel movie', () {
    //
    final model = MovieModel();

    model.getMovie();

    expect(model.movies, completion(isNotNull));

    model.movies.then((movies) {
      expect(movies[2].title, 'Godzilla vs. Kong');
    });
  });
}

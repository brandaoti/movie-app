import 'package:movie_app/app/pages/movie/movie_model.dart';
import 'package:movie_app/app/shared/models/movie.dart';

class MovieController {
  final movieModel = MovieModel();

  Future<List<Movie>> get movie {
    return movieModel.movies;
  }

  loadMovie() {
    return movieModel.getMovie();
  }
}

import '../../shared/models/movie.dart';
import 'movie_model.dart';

class MovieController {
  final movieModel = MovieModel();

  Future<List<Movie>> get movie {
    return movieModel.movies;
  }

  loadMovie() {
    return movieModel.getMovie();
  }
}

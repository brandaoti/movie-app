import 'movie.dart';

class MovieResponse {
  List<Movie> movies;

  MovieResponse({
    this.movies,
  });

  MovieResponse.fromJson(Map<String, dynamic> json) {
    final tempList = json['results'] as List;

    movies = tempList.map((item) {
      return Movie.fromJson(item);
    }).toList();
  }
}

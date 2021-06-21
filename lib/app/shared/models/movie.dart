import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final String firstPath = 'https://image.tmdb.org/t/p/w300';
final String pathNotFound =
    'https://raw.githubusercontent.com/brandaoti/image-repository/main/image-unavailable.png';

class Movie {
  // * Guardar os dados do mapeamento da api

  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final String overview;
  final double popularity;
  final double voteAverange;
  final int voteCount;

  Movie({
    this.id,
    @required this.title,
    @required this.posterPath,
    @required this.backdropPath,
    @required this.releaseDate,
    @required this.overview,
    this.popularity,
    @required this.voteAverange,
    this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("id")) {
      return Movie(
        id: json["id"],
        title: json["title"],
        posterPath: json["poster_path"] != null ? firstPath + json["poster_path"] : pathNotFound,
        backdropPath:
            json["backdrop_path"] != null ? firstPath + json["backdrop_path"] : pathNotFound,
        releaseDate: json["release_date"],
        overview: json["overview"] != "" ? json["overview"] : 'Nenhuma descrição encontrada!',
        voteAverange: json["vote_average"]?.toDouble() ?? 0.0,
      );
    } else {
      return Movie(
        id: json["movieId"],
        title: json["movieTitle"],
        posterPath: json["moviePoster"],
        releaseDate: json["movieRelease"],
        backdropPath: json["movieBackdrop"],
        overview: json["movieOverview"],
        voteAverange: json["movieScore"],
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "movieId": id,
      "movieTitle": title,
      "moviePoster": posterPath,
      "movieRelease": releaseDate,
      "movieBackdrop": backdropPath,
      "movieOverview": overview,
      "movieScore": voteAverange,
    };
  }
}

class MovieDetail {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final String overview;
  final double voteAverange;
  bool isFavorite = false;

  MovieDetail({
    @required this.id,
    @required this.title,
    @required this.posterPath,
    @required this.backdropPath,
    @required this.releaseDate,
    @required this.overview,
    @required this.voteAverange,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json["id"],
      title: json["title"],
      posterPath: json["poster_path"] != null ? firstPath + json["poster_path"] : pathNotFound,
      backdropPath:
          json["backdrop_path"] != null ? firstPath + json["backdrop_path"] : pathNotFound,
      releaseDate: json["release_date"],
      overview: json["overview"] != "" ? json["overview"] : 'Nenhuma descrição encontrada!',
      voteAverange: json["vote_average"]?.toDouble() ?? 0.0,
    );
  }
}

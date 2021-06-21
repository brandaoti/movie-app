import 'package:flutter/material.dart';

class Movie {
  // * Guardar os dados do mapeamento da api

  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final String backdropPath;
  final String overview;
  final double popularity;
  final double voteAverange;
  final int voteCount;

  Movie({
    this.id,
    @required this.title,
    @required this.posterPath,
    @required this.releaseDate,
    this.backdropPath,
    this.overview,
    this.popularity,
    this.voteAverange,
    this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final String firstPath = 'https://image.tmdb.org/t/p/w300';

    if (json.containsKey("id")) {
      return Movie(
        id: json["id"],
        title: json["title"],
        posterPath: json["poster_path"] != null
            ? firstPath + json["poster_path"]
            : 'https://raw.githubusercontent.com/brandaoti/image-repository/main/image-unavailable.png',
        releaseDate: json["release_date"],
        backdropPath: json["backdrop_path"],
        overview: json["overview"],
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

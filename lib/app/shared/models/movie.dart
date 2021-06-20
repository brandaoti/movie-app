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
    this.backdropPath,
    this.overview,
    this.popularity,
    this.voteAverange,
    this.voteCount,
    @required this.title,
    @required this.posterPath,
    @required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("id")) {
      return Movie(
        id: json["id"],
        title: json["title"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        backdropPath: json["backdrop_path"],
        overview: json["overview"],
      );
    } else {
      return Movie(
        id: json["movieId"],
        title: json["movieTitle"],
        posterPath: json["moviePoster"],
        releaseDate: json["movieRelease"],
        backdropPath: json["movieBackdrop"],
        overview: json["movieOverview"],
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
    };
  }
}

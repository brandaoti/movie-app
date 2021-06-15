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
    return Movie(
      id: json['id'],
      title: json["title"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      backdropPath: json["backdrop_path"],
      overview: json["overview"],
    );
  }
}

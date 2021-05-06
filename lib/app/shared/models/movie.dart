import 'package:flutter/material.dart';

class Movie {
  // * Guardar os dados do mapeamento da api
  final String title;
  final String posterPath;
  final String releaseDate;

  Movie({
    @required this.title,
    @required this.posterPath,
    @required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
    );
  }
}

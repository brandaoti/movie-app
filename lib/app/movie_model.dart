import 'package:flutter/material.dart';

// * DADOS MOCADOS
class MovieModel {
  final int id;
  final int year;
  final String title;
  final String poster;

  const MovieModel({
    @required this.id,
    @required this.title,
    @required this.year,
    @required this.poster,
  });
}

var moviesList = [
  MovieModel(
    id: 0,
    title: "Mulan",
    year: 2020,
    poster: 'assets/images/mulan.png',
  ),
  MovieModel(
    id: 1,
    title: "Parasita",
    year: 2020,
    poster: 'assets/images/parasita.png',
  ),
  MovieModel(
    id: 2,
    title: "Wheathering with you",
    year: 2018,
    poster: 'assets/images/wheathering.png',
  ),
  MovieModel(
    id: 3,
    title: "Raya e o último dragão",
    year: 2019,
    poster: 'assets/images/raya.png',
  ),
  MovieModel(
    id: 4,
    title: "Justice League - Snyder Cut",
    year: 2021,
    poster: 'assets/images/justice.png',
  ),
];

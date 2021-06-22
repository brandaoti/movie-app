import 'dart:async';

import 'package:flutter/material.dart';

import '../../shared/models/movie.dart';
import '../../shared/storage/internal_storage.dart';
import '../../shared/storage/secure_storage.dart';
import 'movie_detail_model.dart';

class MovieDetailViewModel {
  final _detailModel = MovieDetailModel();

  StreamController<MovieDetail> _streamController = StreamController.broadcast();
  InternalStorageAdapter _internalStorage;

  // Using adapters to make changing storage easier
  MovieDetailViewModel({
    InternalStorageAdapter adapter,
  }) : _internalStorage = adapter ?? SecureStorage();

  get stream => _streamController.stream;

  // Variables to compare test
  String newFavoriteInstance;
  IconData favorite;

  toggleFavorite(int id) {
    favorite = newFavoriteInstance != null ? Icons.favorite : Icons.favorite_border;

    if (favorite == Icons.favorite_border) {
      saveFavorite(id);
    } else {
      removeFavorite(id);
    }
  }

  loadMovieDetail(int id) {
    _detailModel.getLoadMovieDetail(id).then((value) async {
      newFavoriteInstance = await getFavoriteMovie(value.id);
      value.isFavorite = newFavoriteInstance != null;
      _streamController.add(value);
    });
  }

  Future<String> getFavoriteMovie(int id) async {
    return await _internalStorage.getFavoriteMovie(id);
  }

  saveFavorite(int id) {
    _internalStorage.saveFavorite(id);
  }

  void removeFavorite(int id) {
    _internalStorage.removeFavorite(id);
  }

  void dispose() {
    _streamController.close();
  }
}

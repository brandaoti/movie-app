import 'package:flutter/material.dart';
import 'package:movie_app/app/shared/repository/api/repository_api.dart';

import 'app/app_widget.dart';

void main() {
  final request = RepositoryApi();

  runApp(AppWidget());
  request.fetchMovie();
}

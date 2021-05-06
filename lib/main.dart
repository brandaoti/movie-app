import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'app/shared/repository/api/repository_api.dart';

void main() {
  final request = RepositoryApi();

  runApp(AppWidget());
  request.fetchMovie();
}

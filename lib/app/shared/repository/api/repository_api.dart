import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/movie.dart';

class RepositoryApi {
  // ? variaveis baseURL
  final String authority = 'api.themoviedb.org';
  final String path = '/3/movie/upcoming';
  final Map<String, dynamic> queryParameters = {
    'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
  };

  // Método para fazer requisição
  Future<List<Movie>> fetchMovie() async {
    final request = await http.get(Uri.https(
      authority,
      path,
      queryParameters,
    ));

    if (request.statusCode == 200) {
      final requestJson = jsonDecode(request.body);
      Iterable response = requestJson["results"];
      print(response);

      return response.map((movie) => Movie.fromJson(movie)).toList();
      //
    } else {
      throw Exception('Erro na solicitação!');
    }
  }
}

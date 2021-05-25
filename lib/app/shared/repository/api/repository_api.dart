import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/movie.dart';

class RepositoryApi {
  const RepositoryApi();

  // ? variaveis baseURL
  final String _authority = 'api.themoviedb.org';
  final String _path = '/3/movie/upcoming';
  static Map<String, dynamic> _queryParameters = {
    'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
  };

  // Método para fazer requisição
  Future<List<Movie>> fetchMovie() async {
    final request = await http.get(Uri.https(
      _authority,
      _path,
      _queryParameters,
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

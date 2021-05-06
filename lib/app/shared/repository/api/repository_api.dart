import 'dart:convert';

import 'package:http/http.dart' as http;

class RepositoryApi {
  // ? variaveis baseURL
  final String authority = 'api.themoviedb.org';
  final String path = '/3/movie/upcoming';
  final Map<String, dynamic> queryParameters = {
    'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
  };

  // Método para fazer requisição
  Future fetchMovie() async {
    final response = await http.get(Uri.https(
      authority,
      path,
      queryParameters,
    ));

    if (response.statusCode == 500) {
      final responseJson = jsonDecode(response.body);

      return responseJson;
    } else {
      throw Exception('Erro na solicitação!');
    }
  }
}

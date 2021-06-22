import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/movie.dart';
import '../../models/movie_response.dart';

class RepositoryApi {
  const RepositoryApi();

  // ? variaveis baseURL
  final String _authority = 'api.themoviedb.org';
  final String _path = '/3/movie/upcoming';
  final String _apiKey = 'a5bc05fb630c9b7fdc560033345fa13e';

  // Método para fazer requisição
  Future<MovieResponse> fetchMovie(int page) async {
    var params = {
      'api_key': _apiKey,
      'page': '$page',
    };

    final response = await http.get(Uri.http(_authority, _path, params));

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      print(responseJson);
      return MovieResponse.fromJson(responseJson);
    } else {
      return throw 'Erro no retorno da api';
    }
  }

  Future<MovieDetail> fetchMovieDetail(int id) async {
    var params = {
      'api_key': _apiKey,
    };

    final response = await http.get(Uri.http(_authority, '/3/movie/$id', params));

    if (response.statusCode == 200) {
      return MovieDetail.fromJson(jsonDecode(response.body));
    } else {
      return throw 'Erro no retorno da api';
    }
  }
}

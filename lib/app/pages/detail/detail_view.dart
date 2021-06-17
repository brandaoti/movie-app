import 'package:flutter/material.dart';
import '../../shared/models/movie.dart';

class MovieDetailsView extends StatelessWidget {
  // final Movie movie;

  const MovieDetailsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    bool isFavorite = false;

    bool onFavorite() {
      return !isFavorite ? isFavorite = true : isFavorite = false;
    }

    final movie = ModalRoute.of(context).settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Container para mostrar imagem
          Container(
              height: 500,
              width: size.width,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    // TODO, fazer o tratamento no modelo do parse
                    image: NetworkImage(
                      movie.backdropPath != null
                          ? 'https://image.tmdb.org/t/p/w300' + movie.posterPath
                          : 'https://raw.githubusercontent.com/brandaoti/image-repository/main/image-unavailable.png',
                      // Instanciar nova foto
                    )),
              ),
              // * Container para add um gradient/efeito
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF303030),
                      // Color(0xFF303030).withOpacity(.5),
                      Color(0xFF303030).withOpacity(.1),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              )),

          // nome, data, descrição
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                        width: size.width,
                        color: Colors.red,
                        child: Text(movie.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ))),

                    //!
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.red.withOpacity(.5),
                              ),
                              child: Column(
                                children: [
                                  Text('Lançamento'),
                                  Text(movie.releaseDate),
                                ],
                              )),

                          // Divider(color: Colors.red),
                          Container(
                            // color: Colors.black12,
                            // height: 100,
                            width: MediaQuery.of(context).size.width * .6,
                            margin: EdgeInsets.only(left: 30.0),
                            child: Wrap(
                              // crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: 10.0,
                              children: [
                                Text('Vote'),
                                Text('Popularity'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Descrição',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        // TODO, fazer formatação do texto
                        Text(movie.overview),
                      ],
                    )),
                    //
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        // backgroundColor: Colors.black12,
        child: Icon(
          !isFavorite ? Icons.star_border : Icons.star,
          size: 36.0,
          // color: Colors.deepOrange,
        ),
        onPressed: () {
          onFavorite();
        },
      ),
    );
  }
}

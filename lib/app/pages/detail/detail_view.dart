import 'package:flutter/material.dart';
import '../../shared/models/movie.dart';

class MovieDetailsView extends StatelessWidget {
  final Movie movie;

  const MovieDetailsView(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Container para mostrar imagem
          Column(
            children: [
              Container(
                  height: 400,
                  width: size.width,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w300' +
                              movie.backdropPath,
                        )),
                  ),
                  // * Container para add um gradient/efeito
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF303030),
                          Color(0xFF303030).withOpacity(.5),
                          Color(0xFF303030).withOpacity(.1),
                          Colors.transparent,
                        ],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                      ),
                    ),
                  )),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                    // height: 100,
                    width: size.width,
                    // color: Colors.red,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(movie.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ))),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Column(children: [
                          Text('Lançamento'),
                          Text(movie.releaseDate),
                        ]),
                      ),

                      // * Componentizar container
                      //TODO, fazer refatoração usando components de container
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0), // todo, verificar
                            margin: EdgeInsets.only(left: 12.0, right: 8.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[800], // todo, verificar
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text('coming soon'),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0), // todo, verificar
                            margin: EdgeInsets.only(left: 12.0, right: 8.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[800], // todo, verificar
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text('coming soon'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
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
                      Text(movie.overview),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

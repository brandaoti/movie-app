import 'package:flutter/material.dart';

class BackPosterCardComponent extends StatelessWidget {
  final String backPoster;
  final String title;

  const BackPosterCardComponent({
    Key key,
    @required this.backPoster,
    this.title = 'Nenhum Titulo encontrado',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/w300' + backPoster),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey[700].withOpacity(1.0),
                Colors.grey[700].withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 0.5],
            ),
          ),
        ),
        Positioned(
          bottom: 30.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

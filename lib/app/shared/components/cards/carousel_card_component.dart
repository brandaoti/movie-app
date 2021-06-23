import 'package:flutter/material.dart';

class CarouselCardComponent extends StatelessWidget {
  final String backPoster;
  final String title;

  const CarouselCardComponent({
    Key key,
    this.backPoster,
    this.title = 'Nenhum Titulo encontrado',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: _size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(backPoster),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF020024).withOpacity(0.0),
                Color(0xFF3f3e57).withOpacity(0.0),
                Color(0xFF3f3e57).withOpacity(1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.98, 1.0],
            ),
          ),
        ),
        Positioned(
          bottom: 40.0,
          child: Container(
            width: _size.width,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MovieCardComponent extends StatelessWidget {
  final String posterPath;
  final Function onTap;

  MovieCardComponent({Key key, this.posterPath, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 280,
          maxHeight: 280,
          maxWidth: size.width * .45,
          minWidth: size.width * .45,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(.5),
            image: DecorationImage(
              image: NetworkImage(posterPath),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(.5),
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: Offset(0, 0)),
            ],
          ),
        ),
      ),
    );
  }
}

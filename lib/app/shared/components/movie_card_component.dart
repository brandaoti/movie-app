import 'package:flutter/material.dart';

class MovieCardComponent extends StatelessWidget {
  final String posterPath;

  MovieCardComponent({Key key, this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ConstrainedBox(
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
          color: Colors.white.withOpacity(.6),
          image: DecorationImage(
            image: NetworkImage(posterPath),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.8),
                blurRadius: 3,
                spreadRadius: 3,
                offset: Offset(0, 0)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MovieCardComponent extends StatelessWidget {
  final String posterPath;
  final Function onTap;

  MovieCardComponent({Key key, this.posterPath, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: _size.height * .45,
          minHeight: _size.height * .3,
          maxWidth: _size.width * .45,
          minWidth: _size.width * .4,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(1),
            image: DecorationImage(
              image: NetworkImage(posterPath),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.3),
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

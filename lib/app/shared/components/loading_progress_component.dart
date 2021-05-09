import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingCircularIndicator extends StatelessWidget {
  const LoadingCircularIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.width,
      width: size.width,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(
            strokeWidth: 5.0,
            // backgroundColor: Colors.redAccent,
          ),
          Text('Carregando...', textScaleFactor: 2.0),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingCircularIndicator extends StatelessWidget {
  const LoadingCircularIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height * .45,
      width: _size.width,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class LoadingErrorComponent extends StatelessWidget {
  final Function onPressed;

  const LoadingErrorComponent({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ?
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 54.0),
          SizedBox(height: 12.0),
          Text(
            'Oops! Algo deu errado...',
            style: TextStyle(fontSize: 16.0),
          ),

          // Dialog
          Container(
            child: Dialog(
              backgroundColor: Colors.white.withOpacity(.3),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Falha na conexão',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: 3.0),
                        Icon(Icons.wifi_off, color: Colors.red),
                      ],
                    ),
                    Text(
                      'Sua conexão à internet está lenta. Tente novamente',
                    ),
                    TextButton(
                      child: Text('OK'),
                      onPressed: onPressed,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Container(
            width: 35.0, height: 35.0,
            child: CircularProgressIndicator()
            
            ),
          ),
      );
    }
  }
import 'package:stimmes/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stimmes',
        style: TextStyle(
          color: Color.fromRGBO(240, 108, 155, 1),
          fontSize: 24.0,
          fontFamily: 'Czcionka'
        ),
        ),
      ),
    );

  }
}
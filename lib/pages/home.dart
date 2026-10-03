import 'package:stimmes/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5d491),
      appBar: AppBar(
        toolbarHeight: 90.0,
        backgroundColor: Color(0xfff5d491),
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stimmes',
                style: TextStyle(
                  color: Color.fromRGBO(240, 108, 155, 1),
                  fontSize: 24.0,
                  fontFamily: 'Czcionka'
                ),
              ),
              // const SizedBox(height: 6.0),
              Text('Regulating, not failing',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 10.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Czcionka2'
              ),
              ),
            ], 
          )
        )
      ),
    );

  }
}
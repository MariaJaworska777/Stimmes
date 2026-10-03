import 'package:stimmes/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {

  debugPaintSizeEnabled = false;
  runApp( StimmesApp());

}

class StimmesApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: HomePage()
    );
 }
}
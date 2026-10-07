import 'package:stimmes/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // supabase setup
  await Supabase.initialize(
    url: "https://bknpneuzeakzlszyegvd.supabase.co/rest/v1/",
    publishableKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrbnBuZXV6ZWFremxzenllZ3ZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTEzMTI0ODQsImV4cCI6MjEwNjg4ODQ4NH0.ycVeayKGMy-nXcSexqvJvvQVJWlwsIMr98mlB3tPD8E",
  );


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
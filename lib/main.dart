import 'package:flutter/material.dart';
import './input_page.dart';
void main() {
  runApp(Live());
}

class Live extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue[300],
      ),
      home: Input_page(),
    );
  }
}



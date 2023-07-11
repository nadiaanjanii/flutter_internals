import 'package:flutter/material.dart';
import 'package:flutter_internals/keys/keys.dart';
// import 'package:flutter_internals/ui_update_demo.dart';

void main() {
  final numbers = [1, 2, 3];
  numbers.add(4);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Internals"),
        ),
        body: Keys(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mudawwin/routes/PoemsViewRoute.dart';

void main() {
  runApp(const Mudawwin());
}

class Mudawwin extends StatelessWidget {
  const Mudawwin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mudawwin',
      theme: ThemeData.dark(),
      home: const PoemsViewRoute(),
    );
  }
}


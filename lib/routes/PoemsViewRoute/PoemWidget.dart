import 'package:flutter/material.dart';
import 'package:mudawwin/database/database.dart';

class PoemWidget extends StatelessWidget {
  const PoemWidget({
    Key? key,
    required this.poem,
    required this.callback,
  }) : super(key: key);

  final Poem poem;
  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(onPressed: callback, child: Text(poem.title)),
    );
  }
}
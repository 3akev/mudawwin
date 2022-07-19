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
    String title;
    if (poem.title == '') {
      if (poem.content == '') {
        title = 'قصيدة جديدة';
      } else {
        title = poem.content.split('\n')[0].trim();
      }
    } else {
      title = poem.title;
    }
    return SizedBox(
      child: TextButton(
          onPressed: callback,
          child: Text(
            title,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}

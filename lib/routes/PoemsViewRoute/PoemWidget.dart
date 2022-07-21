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
    String content = '';
    if (poem.title == '') {
      if (poem.content == '') {
        title = 'قصيدة جديدة';
      } else {
        final tmp = poem.content.split('\n');
        title = tmp[0].trim();
        content = tmp.getRange(1, tmp.length).join('\n') + '...';
      }
    } else {
      title = poem.title;
      content = poem.content + '...';
    }
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
        child: TextButton(
      style: TextButton.styleFrom(
        primary: textTheme.bodyText2?.color,
        backgroundColor: textTheme.bodyText2?.backgroundColor,
      ),
      onPressed: callback,
      child: Column(children: [
        Text(
          title,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleLarge,
        ),
        Text(
          content,
          softWrap: true,
        )
      ]),
    ));
  }
}

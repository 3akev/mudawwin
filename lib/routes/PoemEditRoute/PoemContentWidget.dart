import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:mudawwin/database/database.dart';
import 'package:mudawwin/routes/misc.dart';

import 'package:provider/provider.dart';

class PoemContentWidget extends StatefulWidget {
  const PoemContentWidget({Key? key, required this.poem}) : super(key: key);

  final Poem poem;

  @override
  State<PoemContentWidget> createState() => _PoemContentWidgetState();
}

class _PoemContentWidgetState extends State<PoemContentWidget> {
  final textController = TextEditingController();
  late PoetryDatabase db;

  @override
  Widget build(BuildContext context) {
    textController.value = getTextValue(widget.poem.content);
    return Flex(direction: Axis.vertical, children: [
      Expanded(
          child: TextField(
              decoration: null,
              maxLines: null,
              expands: true,
              controller: textController))
    ]);
  }

  @override
  void initState() {
    super.initState();
    textController.addListener(() => updatePoem());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    db = Provider.of<PoetryDatabase>(context, listen: false);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void updatePoem() {
    final companion = PoemsCompanion(
        id: Value(widget.poem.id), content: Value(textController.text));
    db.updatePoem(companion);
  }
}

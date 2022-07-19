import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:mudawwin/database/database.dart';
import 'package:mudawwin/routes/PoemEditRoute/ArabicTextFormatter.dart';
import 'package:mudawwin/routes/misc.dart';
import 'package:provider/provider.dart';

class PoemTitleWidget extends StatefulWidget {
  const PoemTitleWidget({
    Key? key,
    required this.poem,
  }) : super(key: key);

  final Poem poem;

  @override
  State<PoemTitleWidget> createState() => _PoemTitleWidgetState();
}

class _PoemTitleWidgetState extends State<PoemTitleWidget> {
  final textController = TextEditingController();
  late PoetryDatabase db;

  @override
  Widget build(BuildContext context) {
    textController.value = getTextValue(widget.poem.title);
    return TextField(
      inputFormatters: [ArabicTextFormatter()],
      decoration: const InputDecoration(
        hintText: "اكتب العنوان",
        border: InputBorder.none,
      ),
      controller: textController,
    );
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
        id: Value(widget.poem.id), title: Value(textController.text));
    db.updatePoem(companion);
  }
}

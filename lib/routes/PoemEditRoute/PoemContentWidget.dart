import 'package:flutter/material.dart';
import 'package:mudawwin/database/database.dart';

import 'package:provider/provider.dart';

class PoemContentWidget extends StatefulWidget {
  PoemContentWidget({Key? key, required this.poem})
      : super(key: key);

  final Poem poem;

  @override
  State<PoemContentWidget> createState() => _PoemContentWidgetState();
}

class _PoemContentWidgetState extends State<PoemContentWidget> {
  final textController = TextEditingController();

  late final PoetryDatabase db;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      textDirection: TextDirection.rtl,
    );
  }

  @override
  void initState() {
    super.initState();
    textController.addListener(() => db.updatePoem(widget.poem));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    db = Provider.of<PoetryDatabase>(context, listen: false);
  }

}

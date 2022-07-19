import 'package:flutter/material.dart';
import 'package:mudawwin/database/database.dart';
import 'package:mudawwin/routes/PoemEditRoute/PoemContentWidget.dart';
import 'package:mudawwin/routes/PoemEditRoute/PoemTitleWidget.dart';

import 'package:provider/provider.dart';

enum MenuAction { delete }

class PoemEditRoute extends StatefulWidget {
  const PoemEditRoute({Key? key, required this.poem}) : super(key: key);

  final Future<Poem> poem;

  static const routeName = '/poemEditRoute';

  @override
  State<PoemEditRoute> createState() => _PoemEditRouteState();
}

class _PoemEditRouteState extends State<PoemEditRoute> {
  @override
  Widget build(BuildContext context) => FutureBuilder<Poem>(
        future: widget.poem,
        builder: (ctx, snapshot) {
          final poem = snapshot.data ?? Poem(id: 0, title: '', content: '');

          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: getAppbarActions(context, poem),
                title: PoemTitleWidget(poem: poem),
              ),
              body: PoemContentWidget(poem: poem));
        },
      );

  List<Widget> getAppbarActions(BuildContext context, Poem poem) {
    return [
      // IconButton(onPressed: () {}, icon: Icon(Icons.share)),
      PopupMenuButton<MenuAction>(
        itemBuilder: (context) => [
          const PopupMenuItem<MenuAction>(
              value: MenuAction.delete, child: Text("حذف"))
        ],
        onSelected: (item) => deletePoem(context, poem),
      )
    ];
  }

  void deletePoem(BuildContext context, Poem poem) {
    Provider.of<PoetryDatabase>(context, listen: false).removePoem(poem);
    Navigator.pop(context);
  }
}

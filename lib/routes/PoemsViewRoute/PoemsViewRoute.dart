import 'package:flutter/material.dart';
import 'package:mudawwin/database/database.dart';
import 'package:mudawwin/routes/PoemEditRoute/PoemEditRoute.dart';
import 'package:mudawwin/routes/PoemsViewRoute/PoemsList.dart';
import 'package:provider/provider.dart';

class PoemsViewRoute extends StatefulWidget {
  const PoemsViewRoute({Key? key}) : super(key: key);

  @override
  State<PoemsViewRoute> createState() => _PoemsViewRouteState();
}

class _PoemsViewRouteState extends State<PoemsViewRoute> {
  void openPoem(BuildContext context, int id) {
    Navigator.pushNamed(context, PoemEditRoute.routeName,
        arguments: {'poem_id': id}).then((value) => setState(() {}));
  }

  void newPoem() {
    final db = Provider.of<PoetryDatabase>(context, listen: false);
    db.createPoem().then((poem) {
      if (mounted) openPoem(context, poem.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<PoetryDatabase>(context);
    final Future<List<Map<String, dynamic>>> poems = db.allPoems();

    return FutureBuilder<List<Map<String, dynamic>>>(
        future: poems,
        builder: (ctx, snapshot) {
          final data = snapshot.data ?? [];

          return Scaffold(
            appBar: AppBar(
              title: const Align(
                alignment: Alignment.centerRight,
                child: Text('الديوان'),
              ),
            ),
            body: PoemsList(
              poems: data,
              onPoemPressed: (id) => openPoem(context, id),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: newPoem,
              tooltip: 'New Poem',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}

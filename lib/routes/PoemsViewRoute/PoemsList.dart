import 'package:flutter/material.dart';
import 'package:mudawwin/routes/PoemsViewRoute/PoemWidget.dart';

class PoemsList extends StatelessWidget {
  const PoemsList({
    Key? key,
    required this.poems,
    required this.onPoemPressed,
  }) : super(key: key);

  final List<Map<String, dynamic>> poems;
  final void Function(int id) onPoemPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: poems.length,
      itemBuilder: (BuildContext context, int index) => PoemWidget(
        poem: poems[index],
        callback: () => onPoemPressed(poems[index]['poems.id']),
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

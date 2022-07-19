import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mudawwin/database/database.dart';
import 'package:mudawwin/routes/PoemEditRoute/PoemEditRoute.dart';
import 'package:mudawwin/routes/PoemsViewRoute/PoemsViewRoute.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Mudawwin());
}

class Mudawwin extends StatelessWidget {
  const Mudawwin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<PoetryDatabase>(
      create: (context) => PoetryDatabase(),
      dispose: (context, db) => db.close(),
      child: MaterialApp(
          title: 'Mudawwin',
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          supportedLocales: const [Locale('ar', '')],
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Amiri',
          ),
          home: const PoemsViewRoute(),
          onGenerateRoute: (settings) {
            if (settings.name == PoemEditRoute.routeName) {
              final args = settings.arguments as Map;
              return MaterialPageRoute(
                builder: (context) {
                  final poem = Provider.of<PoetryDatabase>(context)
                      .getPoem(args['poem_id']);
                  return PoemEditRoute(poem: poem);
                },
              );
            }
            return null;
          }),
    );
  }
}

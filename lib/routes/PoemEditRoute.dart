import 'package:flutter/material.dart';

class PoemEditRoute extends StatefulWidget {
  const PoemEditRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PoemEditState();
}

class PoemEditState extends State<PoemEditRoute> {
  Widget getBayt() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: Text("السيف اصدق انباء من الكتب"),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text("في حده الحد بين الجد واللعب"),
        )
      ],
    );
  }
  List<Widget> getAbyat() {
    return [getBayt(), getBayt(), getBayt()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: <Widget>[
              Center(
                child: Text("Poem title here"),
              ),
              Expanded(
                child: ListView(
                  children: getAbyat(),
                ),
              ),
            ]
        ),
    );
  }
}
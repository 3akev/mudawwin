import 'package:flutter/material.dart';
import 'package:mudawwin/routes/PoemEditRoute.dart';

class PoemsViewRoute extends StatefulWidget {
  const PoemsViewRoute({Key? key}) : super(key: key);

  @override
  State<PoemsViewRoute> createState() => _PoemsViewRouteState();
}

class _PoemsViewRouteState extends State<PoemsViewRoute> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text('الديوان'),
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PoemEditRoute()),
                      );
                    },
                    child: const Text('Entry A')),
              ),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

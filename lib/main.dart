import 'package:flutter/material.dart';

void main() {
  runApp(const CounterPage());
}

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Simple Counter",
        home: Scaffold(
          body: Center(
            child: Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}

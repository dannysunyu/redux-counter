import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MyApp(),
    ),
  );
}

class Counter extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;

    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<Counter>(builder: (context, counter, child) {
          return Text(
            '${counter.count}',
            style: Theme.of(context).textTheme.headline1,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final counter = Provider.of<Counter>(context, listen: false);
          counter.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

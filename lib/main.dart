import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux_main.dart';

void main() {
  final store = Store<AppState>(counterReducer, initialState: AppState(0));

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
            title: 'Flutter Redux Demo',
            home: Scaffold(
              body: Center(
                child: StoreConnector<AppState, String>(
                  converter: (store) => store.state.count.toString(),
                  builder: (context, count) {
                    return Text(
                      count,
                      style: Theme.of(context).textTheme.headline1,
                    );
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  store.dispatch(CounterAction.increment);
                },
                child: const Icon(Icons.add),
              ),
            )));
  }
}

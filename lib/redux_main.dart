import 'package:redux/redux.dart';

enum Action {
  increment,
  decrement,
  reset,
}

class Counter {
  final int count;

  Counter(this.count);
}

class AppState {
  Counter counter;

  AppState(this.counter);
}

AppState counterReducer(AppState state, dynamic action) {
  if (action == Action.increment) {
    return AppState(Counter(state.counter.count + 1));
  } else if (action == Action.reset) {
    return AppState(Counter(0));
  } else {
    return state;
  }
}

void main() {
  final store = Store<AppState>(counterReducer, initialState: AppState(Counter(0)));

  print('Initial count: ${store.state.counter.count}');
  store.dispatch(Action.increment);
  print('Count: ${store.state.counter.count}');

  store.dispatch(Action.increment);
  print('Count: ${store.state.counter.count}');

  store.dispatch(Action.reset);
  print('Count: ${store.state.counter.count}');
}
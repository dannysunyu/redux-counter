import 'package:redux/redux.dart';

enum CounterAction {
  increment,
  decrement,
  reset,
}

class AppState {
  final int count;

  AppState(this.count);
}

AppState counterReducer(AppState state, dynamic action) {
  if (action == CounterAction.increment) {
    return AppState(state.count + 1);
  } else if (action == CounterAction.reset) {
    return AppState(0);
  } else {
    return state;
  }
}

void main() {
  final store = Store<AppState>(counterReducer, initialState: AppState(0));

  print('Initial count: ${store.state.count}');
  store.dispatch(CounterAction.increment);
  print('Count: ${store.state.count}');

  store.dispatch(CounterAction.increment);
  print('Count: ${store.state.count}');

  store.dispatch(CounterAction.reset);
  print('Count: ${store.state.count}');
}
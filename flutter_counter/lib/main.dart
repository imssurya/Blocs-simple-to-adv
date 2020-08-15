import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'blocs/counter_observer.dart';
import 'counter_app.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const CounterApp());
}

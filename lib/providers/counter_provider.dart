import 'package:flutter/material.dart';
import 'package:counter_client_with_provider/services/counter_service.dart';
import 'package:counter_client_with_provider/models/counter_model.dart';

class CounterProvider extends ChangeNotifier {
  late CounterModel _counterModel = CounterModel(counter: 0);
  CounterModel get counterModel => _counterModel;

  Future<void> incrementCounter() async {
    final newCounterValue = await incrementCounterAsync();

    if (newCounterValue != null) {
      _counterModel = newCounterValue;
    }

    notifyListeners();
  }

  Future<void> decrementCounter() async {
    final newCounterValue = await decrementCounterAsync();

    if (newCounterValue != null) {
      _counterModel = newCounterValue;
    }

    notifyListeners();
  }

  Future<void> getCounter() async {
    final newCounterValue = await getCounterAsync();

    if (newCounterValue != null) {
      _counterModel = newCounterValue;
    }

    notifyListeners();
  }
}

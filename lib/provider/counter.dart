import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  set counter (value){
    _counter = value;
    notifyListeners();
  }

  void increment(){
    counter = counter + 1;
  }

  void decrement(){
    counter = counter - 1;
  }
}
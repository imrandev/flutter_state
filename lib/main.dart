import 'package:flutterstate/provider.dart';
import 'package:flutter/material.dart';
import 'bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MainBloc();
  }
}

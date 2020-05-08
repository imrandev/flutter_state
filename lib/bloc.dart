import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter.dart';

class MainBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'State in Flutter using BLoC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (context, int state){
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
              child: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                            "Counter",
                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey)
                        ),
                        Text(
                            "${state}",
                            style: TextStyle(fontSize: 62.0, fontWeight: FontWeight.bold, color: Colors.lightBlue)
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: (){
                            _counterBloc.add(CounterEvent.increment);
                          },
                          color: Colors.lightBlue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(Icons.add, color: Colors.white,),
                              Text("Increment", style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: (){
                            _counterBloc.add(CounterEvent.decrement);
                          },
                          color: Colors.lightBlue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(Icons.remove, color: Colors.white,),
                              Text("Decrement", style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
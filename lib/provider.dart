import 'package:flutter/material.dart';
import 'package:flutterstate/provider/counter.dart';
import 'package:provider/provider.dart';

class MainProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>.value(
      value: CounterProvider(),
      child: MaterialApp(
        title: 'State in Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'State in Flutter using Provider'),
      ),
    );;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final CounterProvider provider = Provider.of<CounterProvider>(context);
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
                    "${provider.counter}",
                    style: TextStyle(fontSize: 62.0, fontWeight: FontWeight.bold, color: Colors.lightBlue)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                    onPressed: (){
                      provider.increment();
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
                      provider.decrement();
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
  }
}
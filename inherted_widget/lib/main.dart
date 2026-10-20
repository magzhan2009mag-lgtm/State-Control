import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Inherted Widget",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int get counterValue => _counter;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inherted Widget'), centerTitle: true),
      body: ListView(
        children: [MyInheretedWidget(myState: this, child: AppRootWidget())],
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  const AppRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheretedWidget.of(context)!.myState;
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Text('Root Widget', style: Theme.of(context).textTheme.display1),
          Text(
            '${rootWidgetState.counterValue}',
            style: Theme.of(context).textTheme.display1,
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Counter(), Counter()],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheretedWidget.of(context)!.myState;
    return Card(
      margin: const EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.yellowAccent,
      child: Column(
        children: <Widget>[
          const Text('(Child Widget)'),
          Text(
            '${rootWidgetState.counterValue}',
            style: Theme.of(context).textTheme.display1,
          ),
          ButtonBar(
            children: [
              IconButton(
                onPressed: () {
                  rootWidgetState._decrement();
                },
                icon: Icon(Icons.remove),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () {
                  rootWidgetState._increment();
                },
                icon: Icon(Icons.add),
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension on TextTheme {
  TextStyle? get display1 => null;
}

class MyInheretedWidget extends InheritedWidget {
  final _MyHomePageState myState;

  MyInheretedWidget({Key? key, required Widget child, required this.myState})
    : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheretedWidget oldWidget) {
    return this.myState.counterValue != oldWidget.myState.counterValue;
  }

  static MyInheretedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheretedWidget>();
  }
}

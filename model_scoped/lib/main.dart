import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inherted Widget'), centerTitle: true),
      body: ListView(
        children: <Widget>[
          ScopedModel<MyModelState>(
            model: MyModelState(),
            child: _AppRootWidget(),
          ),
        ],
      ),
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(Root Widget)', style: Theme.of(context).textTheme.display1),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[Counter(), Counter()],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModelState>(
      rebuildOnChange: false,
      builder: (context, child, model) => Card(
        margin: const EdgeInsets.all(4.0).copyWith(bottom: 32.0),
        color: Colors.yellowAccent,
        child: Column(
          children: <Widget>[
            const Text('(Child Widget)'),
            Text(
              '${model.counterValue}',
              style: Theme.of(context).textTheme.display1,
            ),
            OverflowBar(
              children: [
                IconButton(
                  onPressed: () {
                    model._decrement();
                  },
                  icon: Icon(Icons.remove),
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () {
                    model._increment();
                  },
                  icon: Icon(Icons.add),
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on TextTheme {
  TextStyle? get display1 => null;
}

class MyModelState extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void _increment() {
    _counter++;
    notifyListeners();
  }

  void _decrement() {
    _counter--;
    notifyListeners();
  }
}

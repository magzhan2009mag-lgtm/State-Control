import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Vanila Demo', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    double _size = 50;
    return Scaffold(
      appBar: AppBar(title: Text('Vanila Demo'), centerTitle: true),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _rating = 1;
                  });
                },
                icon: (_rating >= 1
                    ? Icon(Icons.star, size: _size)
                    : Icon(Icons.star_border, size: _size)),
                color: Colors.indigo,
                iconSize: _size,
              ),
            ),
            Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _rating = 2;
                  });
                },
                icon: (_rating >= 2
                    ? Icon(Icons.star, size: _size)
                    : Icon(Icons.star_border, size: _size)),
                color: Colors.indigo,
                iconSize: _size,
              ),
            ),
            Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _rating = 3;
                  });
                },
                icon: (_rating >= 3
                    ? Icon(Icons.star, size: _size)
                    : Icon(Icons.star_border, size: _size)),
                color: Colors.indigo,
                iconSize: _size,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

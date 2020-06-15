import 'dart:math';
import 'package:flutter/material.dart';

/**
 *
 * Second version of task (more easy)
 *
 */

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  Color _color = Colors.amber; // declare it here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _doSomething();
          });
        },
        child: SizedBox.expand(
          child: Container(
            color: _color,
            child: Center(
              child: Text(
                'Hey there',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Starjedi'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _doSomething() {
    _color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}

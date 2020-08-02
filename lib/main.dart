import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        Screen1.routeName: (context) => Screen1(),
        Screen2.routeName: (context) => Screen2(),
      },
      // home: null,
    );
  }
}

class Argument {
  final String title;
  final String message;

  Argument({this.title, this.message});
}

class Screen2 extends StatelessWidget {
  static const routeName = 'second/';
  @override
  Widget build(BuildContext context) {
    final Argument args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Screen 2'),
            onPressed: () {
              Navigator.pushNamed(
                context,
                Screen2.routeName,
                arguments: Argument(
                  title: 'Screen2',
                  message: 'This is screen 2',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

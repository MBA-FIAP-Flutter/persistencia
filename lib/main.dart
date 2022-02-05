import 'package:aula2_persistencia/home.dart';
import 'package:aula2_persistencia/sqlite/list_person.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/sqlite': (context) => ListPerson(),
        '/nosql': (context) => Container(),
        '/firebase': (context) => Container(),
      },
    );
  }
}
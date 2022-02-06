import 'package:aula2_persistencia/firebase/list_car.dart';
import 'package:aula2_persistencia/home.dart';
import 'package:aula2_persistencia/nosql/list_books.dart';
import 'package:aula2_persistencia/sqlite/list_person.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
        '/nosql': (context) => ListBooks(),
        '/firebase': (context) => ListCars(),
      },
    );
  }
}
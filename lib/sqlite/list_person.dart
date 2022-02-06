import 'package:aula2_persistencia/sqlite/add_person.dart';
import 'package:aula2_persistencia/sqlite/model/person.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListPerson extends StatefulWidget {
  @override
  _ListPersonState createState() => _ListPersonState();
}

class _ListPersonState extends State<ListPerson> {

  Database? _database;
  List<Person> personsList = <Person>[];

  @override
  void initState() {
    super.initState();
    getDatabase();
  }

  getDatabase() async {
    Database db = await openDatabase(
        join(await getDatabasesPath(), 'person_database.db'),
        onCreate: (db, version)
        {
          return db.execute(
            "CREATE TABLE person(id INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT, lastName TEXT, address TEXT)",
          );
        },
        version: 1
    );

    setState(() {
      _database = db;
    });

    readAll();
  }

  readAll() async {
    final List<Map<String, dynamic>> maps = await _database!.query('person');

    personsList = List.generate(maps.length, (i) {
      return Person(
        maps[i]['firstName'],
        maps[i]['lastName'],
        maps[i]['address'],
        id: maps[i]['id']
      );
    });

    setState(() {});
  }

  insertPerson(Person person) {
    _database?.insert(
      'person',
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ).then((value) {
      person.id = value;
      setState(() {
        personsList.add(person);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pessoas"),
        actions: <Widget>[
          if (_database != null) IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddPerson()
                  )
              ).then((newPerson) {
                if (newPerson != null){
                  insertPerson(newPerson);
                }
              });
            },
          )
        ],
      ),
      body: ListView.separated(
        itemCount: personsList.length,
        itemBuilder: (context, index) => buildListItem(index),
        separatorBuilder: (context, index) => Divider(
          height: 1,
        ),
      ),
    );
  }

  Widget buildListItem(int index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: Text("${personsList[index].id}"),
          title: Text(personsList[index].firstName),
          subtitle: Text("${personsList[index].lastName}, ${personsList[index].address}"),
          onLongPress: (){
            deletePerson(index);
          },
        ),
      ),
    );
  }

  deletePerson(int index) {
    _database?.delete(
      'person',//table
      where: "id = ?",//clausura - sql injection
      whereArgs: [personsList[index].id],//argumentos da clausula
    ).then((value) {
      setState(() {
        personsList.removeAt(index);
      });
    });
  }


}

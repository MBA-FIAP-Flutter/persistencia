import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Persistência"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.adjust),
            title: Text("SQLite"),
            subtitle: Text("Lista de Pessoas"),
            trailing: Icon(Icons.navigate_next),
            onTap: (){
              Navigator.pushNamed(context, "/sqlite");
            },
          ),
          Divider(
            height: 1,
            color: Colors.black54,
          ),
          ListTile(
            leading: Icon(Icons.adjust),
            title: Text("Floor"),
            subtitle: Text("Lista de Livros"),
            trailing: Icon(Icons.navigate_next),
            onTap: (){
              Navigator.pushNamed(context, "/nosql");
            },
          ),
          Divider(
            height: 1,
            color: Colors.black54,
          ),
          ListTile(
            leading: Icon(Icons.adjust),
            title: Text("Firebase"),
            subtitle: Text("Lista de Carros"),
            trailing: Icon(Icons.navigate_next),
            onTap: (){
              Navigator.pushNamed(context, "/firebase");
            },
          )
        ],
      ),
    );
  }
}

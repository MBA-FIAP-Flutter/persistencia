import 'package:aula2_persistencia/nosql/model/book.dart';
import 'package:flutter/material.dart';

class AddBook extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo livro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Nome",
                    labelText: "Nome"
                ),
                controller: _nameController,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Insira o nome do livrooa';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(
                    hintText: "Autor",
                    labelText: "Autor"
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Insira o autor do livro';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Book person = Book(
                          _nameController.text,
                          _authorController.text
                      );
                      Navigator.pop(context, person);
                    }
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
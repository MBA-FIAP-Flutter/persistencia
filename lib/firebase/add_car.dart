import 'package:aula2_persistencia/firebase/model/car.dart';
import 'package:aula2_persistencia/nosql/model/book.dart';
import 'package:flutter/material.dart';

class AddCar extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo carro"),
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
                    return 'Insira o nome do carro';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _brandController,
                decoration: InputDecoration(
                    hintText: "Marca",
                    labelText: "Marca"
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Insira a marca do carro';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Car car = Car(
                          _nameController.text,
                          _brandController.text
                      );
                      Navigator.pop(context, car);
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
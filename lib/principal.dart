import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/principal_controller.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  PrincipalController _principalController = PrincipalController();

  _dialog(){
    showDialog(
        context: context,
        builder: (_){
          return AlertDialog(
            title: Text("Adicionar item"),
            content: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite uma descrição..."
              ),
              onChanged: _principalController.setnovoItem,
            ),
            actions: [
              TextButton(
                  onPressed: (){ Navigator.pop(context); },
                  child: Text("Cancelar", style: TextStyle(
                    color: Colors.red
                  ),)
              ),
              TextButton(
                  onPressed: (){
                    _principalController.adicionarItem();
                  },
                  child: Text("Salvar")
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarefas",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Observer(
          builder: (_){
            return ListView.builder(
              itemCount: _principalController.listaItens.length,
              itemBuilder: (_, indice){
                return ListTile(
                  title: Text(_principalController.listaItens[indice]),
                  onTap: (){

                  },
                );
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _dialog();
        },
      ),
    );
  }
}

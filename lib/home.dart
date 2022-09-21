import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/principal.dart';

import 'controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*int _contador = 0;

  _incrementar(){
    setState(() {
      _contador++;
    });
  }*/

  Controller controller = Controller();
  ReactionDisposer? reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // autorun((_){
    //   print(controller.formularioValidado);
    // });

    reactionDisposer = reaction(
        (_) => controller.usuarioLogado,
        (usuarioLogado){
          if (usuarioLogado != null){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_)=> Principal() )
            );
          }
        }
    );
  }

  @override
  void dispose() {
    reactionDisposer!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Padding(
            //     padding: EdgeInsets.all(16),
            //     child: Observer(builder: (_) {
            //       return Text(
            //         "${controller.contador}",
            //         style: TextStyle(color: Colors.black, fontSize: 80),
            //       );
            //     })),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: controller.setEmail,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "Senha"),
                onChanged: controller.setSenha,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(builder: (_) {
                return Text(controller.formularioValidado
                    ? "Validado"
                    : "* Campos não validados");
              }),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Observer(builder: (_) {
                  return ElevatedButton(
                    child: controller.carregando
                        ? CircularProgressIndicator(
                      valueColor:AlwaysStoppedAnimation(Colors.white),)
                        : Text("Logar",
                        style: TextStyle(color: Colors.black, fontSize: 30)),
                    onPressed: controller.formularioValidado
                        ? () {controller.logar();}
                        : null,
                  );
                })),
          ],
        ),
      ),
    );
  }
}

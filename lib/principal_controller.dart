import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

//a utilização do mixin Store é para geração dos códigos automaticos
abstract class PrincipalControllerBase with Store {

  @observable
  String novoItem =  "";

  @action
  void setnovoItem(String valor) => novoItem = valor;

  ObservableList<String> listaItens = ObservableList();

  @action
  void adicionarItem(){
    listaItens.add(novoItem);
    print(listaItens);
  }

}
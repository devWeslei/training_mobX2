import 'package:mobx/mobx.dart';

import 'item_controller.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

//a utilização do mixin Store é para geração dos códigos automaticos
abstract class PrincipalControllerBase with Store {

  @observable
  String novoItem =  "";

  @action
  void setnovoItem(String valor) => novoItem = valor;

  ObservableList<ItemController> listaItens = ObservableList<ItemController>();

  @action
  void adicionarItem(){
    listaItens.add(ItemController(novoItem));
    //print(listaItens);
  }

}
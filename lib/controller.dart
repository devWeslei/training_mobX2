import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

//a utilização do mixin Store é para geração dos códigos automaticos
abstract class ControllerBase with Store {

  @observable
  int contador = 0;

  @action
  incrementar(){
    contador++;
  }

  /*var _contador = Observable(0);
  Action? incrementar;

  Controller(){
    incrementar = Action(_incrementar);
  }

  int get contador => _contador.value;
  set contador(int novoValor) => _contador.value = novoValor;

  _incrementar(){
    contador++;
  }*/

}
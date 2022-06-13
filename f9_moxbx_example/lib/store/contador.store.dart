import 'package:mobx/mobx.dart';
import 'package:mobx_codegen/mobx_codegen.dart';

//parte 2
part 'contador.store.g.dart';

class Contador = _Contador with _$Contador;

//1.parte 1
abstract class _Contador with Store {
  @observable
  int contador = 0;

  @action
  void incrementar() {
    contador++;
  }
}

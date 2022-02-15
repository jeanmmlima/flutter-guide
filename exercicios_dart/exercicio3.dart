import 'pessoa.dart';

main() {
  var p1 = Pessoa();
  p1.nome = 'João';
  p1.cpf = '123.456.789-00';

  print('O ${p1.nome} tem CPF ${p1.cpf}');
}

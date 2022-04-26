void main() {
  
  var alunos = [
    {'nome':'Alfredo', 'nota':9.9 },
    {'nome':'Bia', 'nota':9.1 },
    {'nome':'Carlos', 'nota':7.8 },
    {'nome':'Daniel', 'nota':6.9 },
    {'nome':'Eliza', 'nota':6.8 },
  ];
  
  String Function(Map) pegarNomes = (aluno) => aluno['nome'];
  int Function(String) qtdLetras = (nome) => nome.length;
  
  var nomes = alunos.map(pegarNomes);
  print(nomes);
  var qtdL = nomes.map(qtdLetras);
  print(qtdL);
  
  var doubleQtd = alunos
    .map(pegarNomes)
    .map(qtdLetras)
    .map((qtd) => qtd * 2);
  
  print(doubleQtd);
  
  var notas = [7.3, 5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10.0];
  var total = notas.reduce(somar);
  print(total);

  var nomes2 = ['Ana', 'Bia', 'Carlos', 'Daniel', 'Maria', 'Pedro'];
  print(nomes2.reduce(juntar));
  
  
  var notas2 = alunos
    .map((aluno) => aluno['nota'])
    .map((nota) => (nota as double).roundToDouble());
    //.where((nota) => nota >= 8);
    //.reduce((t,a) => t + a);

    var notasFinais = notas2.reduce((t,a) => t + a);

    print('media ${notasFinais/notas2.length}');


  print(notas2);
  
}

double somar(double acumulador, double elemento) {
  print("$acumulador $elemento");
  return acumulador + elemento;
}

String juntar(String acumulador, String elemento) {
  print("$acumulador => $elemento");
  return "$acumulador,$elemento";
}
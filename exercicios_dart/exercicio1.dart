main(){
  /* Dados Básicos
  int a = 3;
  double b = 3.1;
  var c = 'Você é legal';
  bool estaChovendo = true;
  bool estaFrio = false;
  print(c is String);
  print(estaChovendo || estaFrio);
  */

  //Listas
  var nome = ['Ana','Bia','Carlos'];
  nome.add('Daniel');
  nome.add('Daniel');
  nome.add('Daniel');
  print(nome.length);
  print(nome.elementAt(0));
  print(nome[5]);

  //Conjunto
  //var conjunto = {0,1,2,3,4,4,4};
  Set<int> conjunto = {0,1,2,3,4,4,4};
  print(conjunto.length);

  //Map
  Map<String,double> notasDosAlunos = {
    'Ana': 9.7,
    'Bia': 9.2,
    'Carlos':7.8,
  };

  for(var chave in notasDosAlunos.keys){
    print('chave = $chave');
  }

  for(var valor in notasDosAlunos.values){
    print('valor = $valor');
  }

  for (var registro in notasDosAlunos.entries){
    print('${registro.key} = ${registro.value}');
  }


}
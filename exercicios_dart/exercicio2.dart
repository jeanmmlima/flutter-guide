
//função
soma(int a, int b){
  return (a+b);
}

//passando função como parametro
int exec(int a, int b, int Function(int,int) fn){
  return fn(a,b);
}

//parametro nomeado em função
imprimirProduto({String? nome, double? preco}){
   print('O produto ${nome} tempreço R\$${preco}');
}

//classe
class Produto{
  String? nome; //? significa que a variável pode ser nullable
  double? preco;

  /* construtor 1
  Produto(String nome, double preco){
    this.nome = nome;
    this.preco = preco;
  }
  */

  //construtor 2
  Produto(this.nome,this.preco);


}

main(){

  final r = exec(2,3,(a,b){
    return a - b;
  });

  final s = exec(2,3,(a,b) => a * b + 100);

  print("O valor da soma é: ${soma(2,3)}");
  print("O resultado é: $r");
  print("O resultado é: $s");

  //classe
  var p1 = new Produto('Lapis',4.59);
  var p2 = Produto('Caneta',5.59);
 // p1.nome = 'Lapis';
 // p1.preco = 4.59;
  print('O produto ${p1.nome} tempreço R\$${p1.preco}');
  print('O produto ${p2.nome} tempreço R\$${p2.preco}');

  imprimirProduto(preco: p2.preco, nome: p2.nome);
}
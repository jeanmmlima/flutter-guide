import 'package:flutter/material.dart';

//importando componente questão
import './question.dart';
import './answer.dart';
import './resultado.dart';

main() {
  //para rodar o app, chamar runApp e passar uma instancia do componente criado
  runApp(new PerguntaApp());
}

/* OUTRA FORMA DE RERESENTAR O MAIN
main() => runApp(new PerguntaApp());
*/

/* widget app STATELESS - sem estado interno
o stateless widget torna pergunta app um widget 

class PerguntaApp extends StatelessWidget {
  //variavel mutável em componente sem estado? forma ERRADA!
  //var perguntaSelecionada = 0;
  final perguntaSelecionada = 0;

  /** CRIAÇÃO DOS METODOS A SEREM USADOS
   *  DENTRO DA PROPRIA CLASSE
   * 
   */
  void responder() {
    //perguntaSelecionada++; //viola a ideia de um componente SEM estado
    print(perguntaSelecionada);
  }

  void Function() funcaoQueRetornaOutraFuncao() {
    return () {
      print('Pergunta respondida #2!');
    };
  }

  //método que retorna um widget
  @override //o proprio flutter vai chamar o método - sobrescrita de statelesswidget
  Widget build(BuildContext context) {
    /* ## CONTEXTO
    cada componente tem um CONTEXO
    Serve como referencia para componentes filhos saberem o contexto do componente pai
    Conseguem se comunicar a partir do contexto
    */

    final List<String> perguntas = [
      'Qual é sua cor favorita?',
      'Qual é o seu animal favorito?'
    ];

    //retorna widget chamado material App(); um filgo do widget PerguntaApp
    return MaterialApp(
      //usando atributos nomeados
      //home: Text('Olá Flutter'),

      /* constuindo arvore de componentes para construir a interface
        Componentes podem receber um widget ou, dependendo do componente, mais de um widget
        Nesse caso, componentes recebem um widget que é, na verdade, uma lista de widgets;
      */
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            //Text('Olá flutter!'),
            Text(perguntas.elementAt(perguntaSelecionada)),
            ElevatedButton(
                onPressed:
                    responder, //responder() fica errado pq vc CHAMA a função. respodner apenas PASSA a função
                child: const Text('Resposta 1')),
            ElevatedButton(
                //onPressed: funcaoQueRetornaOutraFuncao(), //chama a função que RETORNA uma função - somente assim
                onPressed: responder,
                child: const Text('Resposta 2')),
            ElevatedButton(
                /*onPressed: (){
                print("Resposta #3");
              }*/
                //onPressed: () => print("Resposta #3 arrow function"),
                onPressed: responder,
                child: const Text('Resposta 3')),
          ],
        ),
        /*
        body: Column(
          //childen recebe uma lista de widgets
          children: [
            Text('Linha 1'),
            Text('Linha 2'),
            Text('Linha 3'),
          ], 
        )
        */
      ),
    );
  }
}
*/

/**
 * Classe Steteful
 */

//classe que gerenciao estado do componente stateful
//_ significa que ela fica no modo privado FORA do escopo desse arquivo;
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  /*
    final List<String> perguntas = [
      'Qual é sua cor favorita?',
      'Qual é o seu animal favorito?'
    ];*/
  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Jean']
    },
  ];

  //método priva
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length - 1;
  }

  /* método build renderiza arvore de componentes e 
  tal árvore depende do ESTADO para ser renderizada
  em componentes stateful. Logo vem para o State
  */
  @override
  Widget build(BuildContext context) {
    /**
     * FORMA 1 - IMPERATIVO
     *     List<Widget> respostas = [];

    for (String textoResposta
        in perguntas[_perguntaSelecionada].cast()['respostas']) {
      respostas.add(Answer(textoResposta, _responder));
    }
     */

    /** FORMA 2 - DECLARATIVO 
    List<String> respostas =
        _perguntas[_perguntaSelecionada].cast()['respostas']; */

    List<String> respostas =
        _perguntas[_perguntaSelecionada].cast()['respostas'];

    //converte lista de strings em uma lista de widgets (MAP)
    List<Widget> answers = respostas.map((t) => Answer(t, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Column(
                  children: [
                    Question(
                        _perguntas[_perguntaSelecionada]['texto'].toString()),
                    /*
            Answer('Resposta 1', _responder),
            Answer('Resposta 2', _responder),
            Answer('Resposta 3', _responder), */
                    ...answers
                  ],
                )
              : Resultado()),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  //precisa implementa o método que cria um estado

  /* FORMA 1
  State<PerguntaApp> createState() {
    return PerguntaAppState();
  }*/

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        perguntas[perguntaSelecionada].cast()['respostas'];

    return Column(
      children: [
        Question(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Answer(
            resp['texto'].toString(),
            () => responder(int.parse(resp['nota'].toString())),
          );
        }).toList()
      ],
    );
  }
}

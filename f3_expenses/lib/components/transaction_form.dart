import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  /* Não é a forma correta de fazer já que o componente é SEM ESTADO
  String? title;
  String? value;
  */

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  //função para comunicação indireta com comonente pai (transaction user)
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              //onChanged: (newValue) => title = newValue,
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextButton(
                style: TextButton.styleFrom(primary: Colors.purple),
                onPressed: _submitForm,
                child: Text('Nova Transação'))
          ],
        ),
      ),
    );
  }
}

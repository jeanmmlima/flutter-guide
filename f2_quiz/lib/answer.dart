import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String titulo;
  final void Function() onSelect;

  Answer(this.titulo, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, onPrimary: Colors.white),
          onPressed: onSelect,
          child: Text(titulo)),
    );
  }
}

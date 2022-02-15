class Pessoa {
  String? nome;
  String? _cpf; //convenção que torna o atributo privado

  set cpf(dynamic novoCPF) {
    this._cpf = novoCPF;
  }

  get cpf {
    return _cpf;
  }
}

class Instituicao {
  const Instituicao(
      {this.id,
      this.nome,
      this.email,
      this.endereco,
      this.telefone,
      this.cep,
      this.status});
  final int id;
  final String nome;
  final String email;
  final String endereco;
  final String telefone;
  final String cep;
  final int status;

  factory Instituicao.fromJson(Map<String, dynamic> json) {
    return Instituicao(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      endereco: json['endereco'],
      telefone: json['telefone'],
      cep: json['cep'],
      status: json['status'],
    );
  }
}

class InstituicaoStatus {
  static const int INATIVO = 0;
  static const int ATIVO = 1;
  static const int PENDENTE = 2;
}

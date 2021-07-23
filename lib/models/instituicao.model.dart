class Instituicao {
  const Instituicao(
      {this.id,
      this.nome,
      this.email,
      this.endereco,
      this.bairro,
      this.cidade,
      this.uf,
      this.telefone,
      this.cep,
      this.latitude,
      this.longitude,
      this.status});
  final int id;
  final String nome;
  final String email;
  final String endereco;
  final String bairro;
  final String cidade;
  final String uf;

  final String telefone;
  final String cep;
  final double latitude;
  final double longitude;
  final int status;

  factory Instituicao.fromJson(Map<String, dynamic> json) {
    return Instituicao(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      endereco: json['endereco'],
      bairro: json['bairro'],
      cidade: json['cidade'],
      uf: json['uf'],
      telefone: json['telefone'],
      cep: json['cep'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      status: json['status'],
    );
  }
}

class InstituicaoStatus {
  static const int INATIVO = 0;
  static const int ATIVO = 1;
  static const int PENDENTE = 2;
}

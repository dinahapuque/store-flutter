// To parse this JSON data, do
//
//     final produtoModel = produtoModelFromJson(jsonString);

import 'dart:convert';

class ProdutoModel {
  final String id;
  final String nome;
  final int valor;
  final TipoOuCategoriaDto tipoProduto;
  final TipoOuCategoriaDto categoriaProduto;

  ProdutoModel({
    this.id,
    this.nome,
    this.valor,
    this.tipoProduto,
    this.categoriaProduto,
  });

  ProdutoModel copyWith({
    String id,
    String nome,
    int valor,
    TipoOuCategoriaDto tipoProduto,
    TipoOuCategoriaDto categoriaProduto,
  }) =>
      ProdutoModel(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        valor: valor ?? this.valor,
        tipoProduto: tipoProduto ?? this.tipoProduto,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
      );

  factory ProdutoModel.fromJson(String str) =>
      ProdutoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromMap(Map<String, dynamic> json) => ProdutoModel(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
        valor: json["valor"] == null ? null : json["valor"],
        tipoProduto: json["tipo_produto"] == null
            ? null
            : TipoOuCategoriaDto.fromMap(json["tipo_produto"]),
        categoriaProduto: json["categoria_produto"] == null
            ? null
            : TipoOuCategoriaDto.fromMap(json["categoria_produto"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "valor": valor == null ? null : valor,
        "tipo_produto": tipoProduto == null ? null : tipoProduto.toMap(),
        "categoria_produto":
            categoriaProduto == null ? null : categoriaProduto.toMap(),
      };

  static List<ProdutoModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<ProdutoModel>((item) => ProdutoModel.fromMap(item)).toList();
  }
}

class TipoOuCategoriaDto {
  final String descricao;

  TipoOuCategoriaDto({
    this.descricao,
  });

  TipoOuCategoriaDto copyWith({
    String descricao,
  }) =>
      TipoOuCategoriaDto(
        descricao: descricao ?? this.descricao,
      );

  factory TipoOuCategoriaDto.fromJson(String str) =>
      TipoOuCategoriaDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoOuCategoriaDto.fromMap(Map<String, dynamic> json) =>
      TipoOuCategoriaDto(
        descricao: json["descricao"] == null ? null : json["descricao"],
      );

  Map<String, dynamic> toMap() => {
        "descricao": descricao == null ? null : descricao,
      };
}

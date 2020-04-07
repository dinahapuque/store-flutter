import 'dart:convert';

import 'package:hasura_flutter/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';

class TipoCategoriaProdutoIdDto {
  final List<TipoECategoriaDto> tipoProduto;
  final List<TipoECategoriaDto> categoriaProduto;
  final Produto produto;

  TipoCategoriaProdutoIdDto({
    this.tipoProduto,
    this.categoriaProduto,
    this.produto,
  });

  TipoCategoriaProdutoIdDto copyWith({
    List<TipoECategoriaDto> tipoProduto,
    List<TipoECategoriaDto> categoriaProduto,
    List<Produto> produto,
  }) =>
      TipoCategoriaProdutoIdDto(
        tipoProduto: tipoProduto ?? this.tipoProduto,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
        produto: produto ?? this.produto,
      );

  factory TipoCategoriaProdutoIdDto.fromJson(String str) =>
      TipoCategoriaProdutoIdDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TipoCategoriaProdutoIdDto.fromMap(Map<String, dynamic> json) =>
      TipoCategoriaProdutoIdDto(
        tipoProduto: json["tipo_produto"] == null
            ? null
            : List<TipoECategoriaDto>.from(
                json["tipo_produto"].map((x) => TipoECategoriaDto.fromMap(x))),
        categoriaProduto: json["categoria_produto"] == null
            ? null
            : List<TipoECategoriaDto>.from(
                json["categoria_produto"].map((x) => TipoECategoriaDto.fromMap(x))),
        produto: json["produto_by_pk"] == null
            ? null
            : Produto.fromMap(json["produto_by_pk"]),
      );

  Map<String, dynamic> toMap() => {
        "tipo_produto": tipoProduto == null
            ? null
            : List<dynamic>.from(tipoProduto.map((x) => x.toMap())),
        "categoria_produto": categoriaProduto == null
            ? null
            : List<dynamic>.from(categoriaProduto.map((x) => x.toMap())),
        "produto_by_pk": produto == null
            ? null
            : produto.toMap(),
      };

  static List<TipoCategoriaProdutoIdDto> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<TipoCategoriaProdutoIdDto>(
            (item) => TipoCategoriaProdutoIdDto.fromMap(item))
        .toList();
  }
}

class Produto {
  final String id;
  final String nome;
  final String tipoProdutoId;
  final TipoECategoriaDto categoriaProduto;
  final TipoECategoriaDto tipoProduto;
  final double valor;

  Produto(
      {this.id,
      this.nome,
      this.tipoProdutoId,
      this.categoriaProduto,
      this.tipoProduto,
      this.valor});

  Produto copyWith({
    String id,
    String nome,
    String tipoProdutoId,
    TipoECategoriaDto categoriaProduto,
    TipoECategoriaDto tipoProduto,
    double valor,
  }) =>
      Produto(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        tipoProdutoId: tipoProdutoId ?? this.tipoProdutoId,
        categoriaProduto: categoriaProduto ?? this.categoriaProduto,
        tipoProduto: tipoProduto ?? this.tipoProduto,
        valor: valor ?? this.valor,
      );

  factory Produto.fromJson(String str) => Produto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Produto.fromMap(Map<String, dynamic> json) => Produto(
        id: json["id"],
        nome: json["nome"],
        tipoProdutoId: json["tipo_produto_id"],
        categoriaProduto: TipoECategoriaDto.fromMap(json["categoria_produto"]),
        tipoProduto: TipoECategoriaDto.fromMap(json["tipo_produto"]),
        valor: json["valor"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "tipo_produto_id": tipoProdutoId,
        "categoria_produto": categoriaProduto.toMap(),
        "tipo_produto": tipoProduto.toMap(),
        "valor": valor
      };
}


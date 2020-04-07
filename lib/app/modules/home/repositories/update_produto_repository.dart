import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasura_flutter/app/modules/home/models/tipo_categoria_produto_id_dto.dart';

class UpdateProdutoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  UpdateProdutoRepository(this._hasuraConnect);

  Future<TipoCategoriaProdutoIdDto> getTipoCategoriaProdutoId(produtoId) async {
    var query = r'''
                query getTipoCategoriaProdutoId($produtoId: uuid!) {
  tipo_produto {
    id
    descricao
  }
  categoria_produto {
    id
    descricao
  }
  produto_by_pk(id: $produtoId) {
    id
    nome
    valor
    categoria_produto {
      id
      descricao
    }
    tipo_produto {
      id
      descricao
    }
  }
}
                ''';

    var snapshot =
        await _hasuraConnect.query(query, variables: {"produtoId": produtoId});
    return TipoCategoriaProdutoIdDto.fromMap(snapshot["data"]);
  }

  Future<bool> updateProduto(String descricao, String valor, String tipo,
      String categoria, String produtoId) async {
    var mutation = r'''
mutation updateProduto($nome: String, $valor: float8, $categoria: uuid, $tipo: uuid, $produtoId: uuid) {
  update_produto(
    where: {id: {_eq: $produtoId}}, 
    _set: {nome: $nome, valor: $valor, tipo_produto_id: $tipo, categoria_produto_id: $categoria}) {
    affected_rows
  }
}

                ''';

    var snapshot = await _hasuraConnect.mutation(mutation, variables: {
      "nome": descricao,
      "tipo": tipo,
      "categoria": categoria,
      "valor": valor,
      "produtoId": produtoId
    });

    return snapshot["data"]["update_produto"]["affected_rows"] > 0;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

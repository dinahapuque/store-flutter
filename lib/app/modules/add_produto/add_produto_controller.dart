import 'package:hasura_flutter/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:hasura_flutter/app/modules/add_produto/repositories/add_produto_repository.dart';
import 'package:mobx/mobx.dart';

part 'add_produto_controller.g.dart';

class AddProdutoController = _AddProdutoControllerBase
    with _$AddProdutoController;

abstract class _AddProdutoControllerBase with Store {
  final AddProdutoRepository _addProdutoRepository;

  @observable
  String descricao = "";

  @action
  setDescricao(String _desc) {
    descricao = _desc;
  }

  @observable
  String valor = "";

  @action
  setValor(String _valor) {
    valor = _valor;
  }

  @observable
  TipoECategoriaDto selectedCategoria;

  @action
  setSelectedCategoria(TipoECategoriaDto _selectedCategoria) {
    selectedCategoria = _selectedCategoria;
  }

  @observable
  TipoECategoriaDto selectedTipo;

  @action
  setSelectedTipo(TipoECategoriaDto _selectedTipo) {
    selectedTipo = _selectedTipo;
  }

  _AddProdutoControllerBase(this._addProdutoRepository) {
    _addProdutoRepository.getTipoCategoriaProduto().then((data) {
      tipoProduto = data;
    });
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;

  @action
  Future<bool> adicionar() async {
    if (this.descricao != null &&
        this.valor != null &&
        this.selectedTipo.id != null &&
        this.selectedCategoria.id != null) {
      bool res = await _addProdutoRepository.addProduto(this.descricao,
          this.valor, this.selectedTipo.id, this.selectedCategoria.id);
      return res;
    }
    return false;
  }
}

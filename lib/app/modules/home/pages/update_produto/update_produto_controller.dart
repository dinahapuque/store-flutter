import 'package:flutter/widgets.dart';
import 'package:hasura_flutter/app/modules/home/pages/update_produto/repositories/update_produto_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:hasura_flutter/app/modules/home/models/tipo_categoria_produto_id_dto.dart';
import 'package:hasura_flutter/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
part 'update_produto_controller.g.dart';

class UpdateProdutoController = _UpdateProdutoControllerBase
    with _$UpdateProdutoController;

abstract class _UpdateProdutoControllerBase with Store {
  final UpdateProdutoRepository _updateProdutoRepository;
  
  TextEditingController descricaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  String produtoId;

  @action
  setId(String id) {
    this.produtoId = id;

    _updateProdutoRepository
        .getTipoCategoriaProdutoId(this.produtoId)
        .then((data) {
      updatedProduto = data;
      descricaoController.text = updatedProduto.produto.nome;
      valorController.text = updatedProduto.produto.valor.toString();
      selectedTipo = updatedProduto.produto.tipoProduto;
      selectedCategoria = updatedProduto.produto.categoriaProduto;
    });
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

  @observable
  TipoCategoriaProdutoIdDto updatedProduto;

  _UpdateProdutoControllerBase(this._updateProdutoRepository);

  @action
  Future<bool> salvar() async {
    if (this.descricaoController.text != null &&
        this.valorController.text != null &&
        this.selectedTipo.id != null &&
        this.selectedCategoria.id != null) {
      bool res = await _updateProdutoRepository.updateProduto(
          this.descricaoController.text,
          this.valorController.text,
          this.selectedTipo.id,
          this.selectedCategoria.id,
          this.produtoId);
      return res;
    }
    return false;
  }
}

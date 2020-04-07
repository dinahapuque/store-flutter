// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UpdateProdutoController on _UpdateProdutoControllerBase, Store {
  final _$selectedCategoriaAtom =
      Atom(name: '_UpdateProdutoControllerBase.selectedCategoria');

  @override
  TipoECategoriaDto get selectedCategoria {
    _$selectedCategoriaAtom.context.enforceReadPolicy(_$selectedCategoriaAtom);
    _$selectedCategoriaAtom.reportObserved();
    return super.selectedCategoria;
  }

  @override
  set selectedCategoria(TipoECategoriaDto value) {
    _$selectedCategoriaAtom.context.conditionallyRunInAction(() {
      super.selectedCategoria = value;
      _$selectedCategoriaAtom.reportChanged();
    }, _$selectedCategoriaAtom, name: '${_$selectedCategoriaAtom.name}_set');
  }

  final _$selectedTipoAtom =
      Atom(name: '_UpdateProdutoControllerBase.selectedTipo');

  @override
  TipoECategoriaDto get selectedTipo {
    _$selectedTipoAtom.context.enforceReadPolicy(_$selectedTipoAtom);
    _$selectedTipoAtom.reportObserved();
    return super.selectedTipo;
  }

  @override
  set selectedTipo(TipoECategoriaDto value) {
    _$selectedTipoAtom.context.conditionallyRunInAction(() {
      super.selectedTipo = value;
      _$selectedTipoAtom.reportChanged();
    }, _$selectedTipoAtom, name: '${_$selectedTipoAtom.name}_set');
  }

  final _$updatedProdutoAtom =
      Atom(name: '_UpdateProdutoControllerBase.updatedProduto');

  @override
  TipoCategoriaProdutoIdDto get updatedProduto {
    _$updatedProdutoAtom.context.enforceReadPolicy(_$updatedProdutoAtom);
    _$updatedProdutoAtom.reportObserved();
    return super.updatedProduto;
  }

  @override
  set updatedProduto(TipoCategoriaProdutoIdDto value) {
    _$updatedProdutoAtom.context.conditionallyRunInAction(() {
      super.updatedProduto = value;
      _$updatedProdutoAtom.reportChanged();
    }, _$updatedProdutoAtom, name: '${_$updatedProdutoAtom.name}_set');
  }

  final _$salvarAsyncAction = AsyncAction('salvar');

  @override
  Future<bool> salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  final _$_UpdateProdutoControllerBaseActionController =
      ActionController(name: '_UpdateProdutoControllerBase');

  @override
  dynamic setId(String id) {
    final _$actionInfo =
        _$_UpdateProdutoControllerBaseActionController.startAction();
    try {
      return super.setId(id);
    } finally {
      _$_UpdateProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedCategoria(TipoECategoriaDto _selectedCategoria) {
    final _$actionInfo =
        _$_UpdateProdutoControllerBaseActionController.startAction();
    try {
      return super.setSelectedCategoria(_selectedCategoria);
    } finally {
      _$_UpdateProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedTipo(TipoECategoriaDto _selectedTipo) {
    final _$actionInfo =
        _$_UpdateProdutoControllerBaseActionController.startAction();
    try {
      return super.setSelectedTipo(_selectedTipo);
    } finally {
      _$_UpdateProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'selectedCategoria: ${selectedCategoria.toString()},selectedTipo: ${selectedTipo.toString()},updatedProduto: ${updatedProduto.toString()}';
    return '{$string}';
  }
}

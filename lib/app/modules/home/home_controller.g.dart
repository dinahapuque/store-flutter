// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listaProdutosAtom = Atom(name: '_HomeControllerBase.listaProdutos');

  @override
  ObservableStream<List<ProdutoModel>> get listaProdutos {
    _$listaProdutosAtom.context.enforceReadPolicy(_$listaProdutosAtom);
    _$listaProdutosAtom.reportObserved();
    return super.listaProdutos;
  }

  @override
  set listaProdutos(ObservableStream<List<ProdutoModel>> value) {
    _$listaProdutosAtom.context.conditionallyRunInAction(() {
      super.listaProdutos = value;
      _$listaProdutosAtom.reportChanged();
    }, _$listaProdutosAtom, name: '${_$listaProdutosAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'listaProdutos: ${listaProdutos.toString()}';
    return '{$string}';
  }
}

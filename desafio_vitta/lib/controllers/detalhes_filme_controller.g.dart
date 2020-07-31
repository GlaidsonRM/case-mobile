// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhes_filme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalhesFilmeController on DetalhesFilmeControllerBase, Store {
  final _$isLoadingAtom = Atom(name: 'DetalhesFilmeControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$detalhesAtom = Atom(name: 'DetalhesFilmeControllerBase.detalhes');

  @override
  FilmeDetalhes get detalhes {
    _$detalhesAtom.reportRead();
    return super.detalhes;
  }

  @override
  set detalhes(FilmeDetalhes value) {
    _$detalhesAtom.reportWrite(value, super.detalhes, () {
      super.detalhes = value;
    });
  }

  final _$pesquisarFilmeAsyncAction =
      AsyncAction('DetalhesFilmeControllerBase.pesquisarFilme');

  @override
  Future pesquisarFilme(String imdb) {
    return _$pesquisarFilmeAsyncAction.run(() => super.pesquisarFilme(imdb));
  }

  final _$DetalhesFilmeControllerBaseActionController =
      ActionController(name: 'DetalhesFilmeControllerBase');

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$DetalhesFilmeControllerBaseActionController
        .startAction(name: 'DetalhesFilmeControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$DetalhesFilmeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
detalhes: ${detalhes}
    ''';
  }
}

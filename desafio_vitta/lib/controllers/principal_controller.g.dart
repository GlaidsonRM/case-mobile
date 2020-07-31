// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principal_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PrincipalController on PrincipalControllerBase, Store {
  final _$isLoadingAtom = Atom(name: 'PrincipalControllerBase.isLoading');

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

  final _$listaFilmesAtom = Atom(name: 'PrincipalControllerBase.listaFilmes');

  @override
  List<Filme> get listaFilmes {
    _$listaFilmesAtom.reportRead();
    return super.listaFilmes;
  }

  @override
  set listaFilmes(List<Filme> value) {
    _$listaFilmesAtom.reportWrite(value, super.listaFilmes, () {
      super.listaFilmes = value;
    });
  }

  final _$buscaAtom = Atom(name: 'PrincipalControllerBase.busca');

  @override
  Busca get busca {
    _$buscaAtom.reportRead();
    return super.busca;
  }

  @override
  set busca(Busca value) {
    _$buscaAtom.reportWrite(value, super.busca, () {
      super.busca = value;
    });
  }

  final _$pesquisarFilmesAsyncAction =
      AsyncAction('PrincipalControllerBase.pesquisarFilmes');

  @override
  Future pesquisarFilmes(String pesquisa, BuildContext context) {
    return _$pesquisarFilmesAsyncAction
        .run(() => super.pesquisarFilmes(pesquisa, context));
  }

  final _$PrincipalControllerBaseActionController =
      ActionController(name: 'PrincipalControllerBase');

  @override
  dynamic setIsLoading(bool value) {
    final _$actionInfo = _$PrincipalControllerBaseActionController.startAction(
        name: 'PrincipalControllerBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$PrincipalControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
listaFilmes: ${listaFilmes},
busca: ${busca}
    ''';
  }
}

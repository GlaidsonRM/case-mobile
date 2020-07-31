import 'package:desafiovitta/model/busca.dart';
import 'package:desafiovitta/model/filme.dart';
import 'package:desafiovitta/utils/alert.dart';
import 'package:desafiovitta/utils/data_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

abstract class PrincipalControllerBase with Store{

  @observable
  bool isLoading = true;

  @action
  setIsLoading(bool value){
    isLoading = value;
  }

  @observable
  List<Filme> listaFilmes = new List();

  @observable
  Busca busca;

  @action
  pesquisarFilmes(String pesquisa, BuildContext context) async {
    try{
      if(pesquisa == null || pesquisa.isEmpty || pesquisa.length < 3)
        return;
      bool conexao = await checarConexao();
      if(!conexao){
        setIsLoading(false);
        alert(context, 'Verifique sua conexão com a '
            'internet e tente novamente.');
        return;
      }

      listaFilmes = new List();
      setIsLoading(true);
      var getFilmes = await http
          .get('http://www.omdbapi.com?apikey=d12b4be8&s=${pesquisa.toLowerCase()}&type=movie')
          .timeout(Duration(seconds: 90));

      if(getFilmes.statusCode == 200){
        Map responseMap = json.decode(getFilmes.body);

        busca = Busca.fromJson(responseMap);

        if(busca.filmes != null && busca.filmes.length > 0)
          listaFilmes = busca.filmes;

        setIsLoading(false);
      }

    }catch(e){
      alert(context, 'Não foi possível pesquisar, tente mais tarde');
      setIsLoading(false);
    }
  }

}
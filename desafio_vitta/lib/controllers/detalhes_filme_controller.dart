import 'package:desafiovitta/model/filme_detalhes.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'detalhes_filme_controller.g.dart';

class DetalhesFilmeController = DetalhesFilmeControllerBase with _$DetalhesFilmeController;

abstract class DetalhesFilmeControllerBase with Store{

  @observable
  bool isLoading = true;

  @action
  setIsLoading(bool value){
    isLoading = value;
  }

  @observable
  FilmeDetalhes detalhes;

  @action
  pesquisarFilme(String imdb) async {
    try{
      setIsLoading(true);
      var getFilmes = await http
          .get('http://www.omdbapi.com/?apikey=d12b4be8&i=$imdb')
          .timeout(Duration(seconds: 90));

      if(getFilmes.statusCode == 200){
        Map responseMap = json.decode(getFilmes.body);

        detalhes = FilmeDetalhes.fromJson(responseMap);

        setIsLoading(false);
      }

    }catch(e){
      setIsLoading(false);
    }
  }

}
import 'package:desafiovitta/model/filme.dart';

class Busca {
  List<Filme> filmes;
  String totalResults;
  String response;

  Busca({this.filmes, this.totalResults, this.response});

  Busca.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      filmes = new List<Filme>();
      json['Search'].forEach((v) {
        filmes.add(new Filme.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filmes != null) {
      data['Search'] = this.filmes.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = this.totalResults;
    data['Response'] = this.response;
    return data;
  }
}
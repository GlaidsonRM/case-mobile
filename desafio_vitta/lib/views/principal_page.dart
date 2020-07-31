
import 'package:desafiovitta/controllers/principal_controller.dart';
import 'package:desafiovitta/model/filme.dart';
import 'package:desafiovitta/utils/alert.dart';
import 'package:desafiovitta/utils/data_checker.dart';
import 'package:desafiovitta/utils/nav.dart';
import 'package:desafiovitta/views/detalhes_filme_page.dart';
import 'package:desafiovitta/widgets/text_grey.dart';
import 'package:desafiovitta/widgets/text_white.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../constants.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final controller = PrincipalController();

  @override
  void initState() {
    controller.pesquisarFilmes('croods', context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Vitta Filmes',),
            centerTitle: true,
            elevation: 0,
          ),
          body: Observer(
            builder: (_){
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                        colors: [
                          cor1Card,
                          cor2Card
                        ]
                    )
                ),
                child:
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                        ),
                        child: TextFormField(
                          style: TextStyle(),
                          onChanged: (value){
                            controller.pesquisarFilmes(value, context);
                          },
                          decoration: InputDecoration(
                              hintText: 'Pesquise um filme',
                              suffixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)
                              )
                          ),
                        ),
                      ),
                    ),
                    controller.isLoading ?
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWhite('Buscando Titulos...', size: 24,),
                          SizedBox(height: 12,),
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        ],
                      ),
                    ) :
                        controller.listaFilmes.length <= 0 ?
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWhite('Nenhum filme encontrado...', size: 24,),
                            ],
                          ),
                        ) :
                        Expanded(
                      child: ListView.builder(
                        itemCount: controller.listaFilmes.length,
                        itemBuilder: (context, index) {

                          Filme filme = controller.listaFilmes[index];

                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: InkWell(
                              onTap: () async {
                                bool conexao = await checarConexao();
                                if(!conexao){
                                  alert(context, 'Verifique sua conexão com a '
                                      'internet e tente novamente.');
                                  return;
                                }
                                else {
                                  push(
                                      context, DetalhesFilmePage(filme.imdbID));
                                }
                              },
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.70,
                                    height: MediaQuery.of(context).size.height * 0.50,
                                    child: Card(
                                      elevation: 70,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: filme.poster != null
                                            && filme.poster != 'N/A'
                                        && filme.poster.isNotEmpty
                                            ? Image.network(
                                          filme.poster,
                                          fit: BoxFit.fitHeight,
                                        ) : Image.asset('assets/images/sem_foto.png'),
                                      ),
                                    ),
                                  ),
                                  TextWhite(filme.title, size: 24,),
                                  TextGrey(filme.year),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              );
            },
          ),

    );
  }
}
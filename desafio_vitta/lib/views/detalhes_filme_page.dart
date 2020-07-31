import 'package:desafiovitta/controllers/detalhes_filme_controller.dart';
import 'package:desafiovitta/widgets/text_grey.dart';
import 'package:desafiovitta/widgets/text_white.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../constants.dart';

class DetalhesFilmePage extends StatefulWidget {

  String idFilme;
  DetalhesFilmePage(this.idFilme);

  @override
  _DetalhesFilmePageState createState() => _DetalhesFilmePageState();
}

class _DetalhesFilmePageState extends State<DetalhesFilmePage> {
  final controller = DetalhesFilmeController();

  @override
  void initState() {
    controller.pesquisarFilme(widget.idFilme);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Filme'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Observer(
        builder: (_){
          return  Container(
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
                  controller.isLoading ?
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWhite('Aguarde...', size: 24,),
                        SizedBox(height: 12,),
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      ],
                    ),
                  ) :
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            TextWhite(controller.detalhes.title, size: 20,),
                            SizedBox(height: 12,),
                            controller.detalhes.poster != null
                                && controller.detalhes.poster != 'N/A'
                                && controller.detalhes.poster.isNotEmpty
                                ? Image.network(
                              controller.detalhes.poster,
                              fit: BoxFit.scaleDown,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height * 0.60,
                            ) : Image.asset('assets/images/sem_foto.png'),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                              child: RaisedButton(
                                elevation: 12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                color: Colors.red.shade400,
                                onPressed: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.play_circle_filled, color: Colors.white,),
                                    SizedBox(width: 12,),
                                    TextWhite('Assistir')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      _label(controller.detalhes.imdbRating),
                                      _label(controller.detalhes.genre),
                                      _label(controller.detalhes.year),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      _data('ImdB'),
                                      _data('Gênero'),
                                      _data('Ano'),
                                    ],
                                  ),
                                ],
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(child: Column(
                                children: <Widget>[
                                  TextWhite(controller.detalhes.plot),
                                ],
                              )),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
          );
        },
      ),
    );
  }

  _label(String label) {
    return Expanded(child: Center(child: TextWhite(label)));
  }

  _data(String data) {
    return Expanded(child: Center(child: TextGrey(data)));
  }

}
import 'package:desafiovitta/constants.dart';
import 'package:desafiovitta/utils/nav.dart';
import 'package:desafiovitta/views/principal_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {

    _delay(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [
              1.0,
              1.0
            ],
            colors: [
              cor1Card,
              cor2Card
            ]
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Vitta Filmes",
                style: TextStyle(
                  fontFamily: "Copperplate",
                  fontSize: 56,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12,),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  _delay(ctx) async {
    Future.wait([Future.delayed(Duration(seconds: 3))]).then((value) {
      push(ctx, PrincipalPage(), replace: true);
    });
  }
}
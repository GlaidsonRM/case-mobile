
import 'package:flutter/material.dart';

alert(BuildContext context, String msg, {Function callback}) {
  showDialog(
      context: context,
    barrierDismissible: false,
    builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18)
            ),
            title: Text("Vitta Filmes"),
            content: Text(msg),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  if(callback != null){
                    callback.call();
                  }
                },
              ),
            ],
          ),
        );
    }
  );
}
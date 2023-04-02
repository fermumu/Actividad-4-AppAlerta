import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyDialog(),
  ));
}

class MyDialog extends StatefulWidget {
  @override
  State<MyDialog> createState() => _MyDialogState();
}

enum DialogAction { yes, no }

class _MyDialogState extends State<MyDialog> {
  String _inputValue = "";

  void _alertResult(DialogAction action) {
    print("Tu seleccion es $action ");
  }

  void _showAlert(String value) {
    AlertDialog dialog = new AlertDialog(
      content: new Text(value),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              _alertResult(DialogAction.yes);
            },
            child: new Text("Aceptar")),
        new FlatButton(
            onPressed: () {
              _alertResult(DialogAction.no);
            },
            child: new Text("Denegar")),
      ],
    );
    showDialog(builder: (context) => dialog, context: context);
  }

  void _onChanged(String value) {
    setState(() {
      _inputValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Alert Dialog"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: "Ingrese Texto"),
                onChanged: (String value) {
                  _onChanged(value);
                },
              ),
              new RaisedButton(
                child: new Text("Ver alerta"),
                onPressed: () {
                  _showAlert(_inputValue);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

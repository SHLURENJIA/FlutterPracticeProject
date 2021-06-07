import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget {
  String tip;

  TipRoute({Key key, @required this.tip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("title")),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: [
              Text(tip),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("back"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

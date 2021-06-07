
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_22/tip_route.dart';

class MyNewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("myNewRoute"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            var result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  ///路由跳转常见的一个需求是带参数。可以在构造方法中定义参数传递过去
                  return TipRoute(
                    // 路由参数
                    tip: "我是提示xxxx",
                  );
                },
              ),
            );
            //输出`TipRoute`路由返回结果
            print("路由返回值: $result");
          },
          child: Text("打开提示页"),
        ),
      )
    );

  }

}
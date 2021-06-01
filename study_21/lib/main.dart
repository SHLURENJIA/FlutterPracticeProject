//导入包
import 'package:flutter/material.dart';

//程序入口
void main() {
  runApp(MyApp());
}

///runApp中使用，表示flutter应用的根widget。集成自StatelessWidget，表示其也是一个widget
class MyApp extends StatelessWidget {
  ///widget的主要工作是提供一个build()方法来描述如何构建UI界面
  @override
  Widget build(BuildContext context) {
    ///MaterialApp一个默认的主题widget，包含界面的基本内容
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      ///home 为Flutter应用的首页，它也是一个widget
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

///MyHomePage 是Flutter应用的首页，集成自StatefulWidget
///Stateful widget至少由两个类组成：一个StatefulWidget类，一个State类；
///StatefulWidget类本身是不变的，但是State类中持有的状态在widget生命周期中可能会发生变化
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


///state的作用就是保存状态，各种可变且影响UI的数据源
///当setState调用后表示状态更新了，就会触发build方法重新构建widget
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //当点击按钮时会调用此函数，修改state，更新_counter
  void _incrementCounter() {
    ///setState方法的作用是通知Flutter框架，当有状态发生了改变，
    ///Flutter框架收到通知后，会执行build方法来根据新的状态重新构建界面
    setState(() {
      _counter++;
    });
  }

  //这里就是状态发生改变后的build触发地方
  @override
  Widget build(BuildContext context) {

    ///Scaffold 是 Material 库中提供的页面脚手架，它提供了默认的导航栏、标题和包含主屏幕的body属性
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        ///Column的作用是将其所有子组件沿屏幕垂直方向依次排列
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

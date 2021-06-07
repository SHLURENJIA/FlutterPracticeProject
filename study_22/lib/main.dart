import 'package:flutter/material.dart';
import 'package:study_22/new_route.dart';
///2.2 路由

///Route 在 Android 中通常指一个 Activity，在 iOS 中指一个 ViewController
///
/// MaterialApp有个回调方法，onGenerateRoute。他在非注册路由表情况下打开的路由，会调用此方法创建路由。
/// 这样可以满足打开路由前判断是否能打开等的场景

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'study 2_2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      ///注册路由表，这样路由就可以使用别名来访问
      routes: {
        "new_route":(context) => MyNewRoute()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            ///主要是添加了MaterialPageRoute，他是一个模态路由，还定义了路由构建及切换时过渡动画的相关接口及属性（i/a动画效果不一样）
            //MaterialPageRoute({
            //     WidgetBuilder builder, //路由页面构建的实例，返回值是一个widget
            //     RouteSettings settings,//包含路由的配置信息，如路由名称、是否初始路由（首页）
            //     bool maintainState = true,//默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false
            //     bool fullscreenDialog = false,//示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）
            //   })

            ///Navigator 是路由管理的组件，通过一个栈来管理活动路由集合，可以push和pop
            TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, "new_route");
                  // Navigator.push(context, MaterialPageRoute(builder:(context){
                  //   return new MyNewRoute();
                  // } ));
                },
                child: new Text("newRoute"))
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

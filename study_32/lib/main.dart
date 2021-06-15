import 'package:flutter/material.dart';

/// flutter 中有万物皆 widget 的概念，实际上 widget 并不是最终绘制在设备中的显示元素，他只是描述显示元素的配置数据
/// flutter 中真正代表显示元素的类是 Element，一个Widget可以对应多个 Element

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // BuildContext 表示当前widget在widget树中的上下文，每一个widget都会对应一个context对象
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new ParentWidgetC(),
    );
  }
}

///一个StatefulWidget类会对应一个State类，State表示与其对应的StatefulWidget要维护的状态
///在widget构建时获取同步
///或者通过setState更新同步

///响应式编程里面永恒的主题之一：状态管理
///大抵可以分为1、widget自己管理；2、父widget管理子widget；3、父子混合管理
// <editor-fold defaultstate="collapsed" desc="TapBoxA - 示范自身管理State">
class TapBoxA extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _TapBoxAState();
  }
}

class _TapBoxAState extends State<TapBoxA>{
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? "Active" : "Inactive",
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }

}
// </editor-fold >

// <editor-fold defaultstate="collapsed" desc="TapBoxB - 父管理子">



class ParentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ParentState();
  }
}

class _ParentState extends State<ParentWidget>{
  bool _active = false;

  void _handleBoxChange(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ChildWidget(
          active: _active,
          onChange: _handleBoxChange,
      ),
    );
  }

}

///childWidget 通过回调将状态导出到Parent中，由Parent管理。因此Parent是StatefulWidget，而child是StatelessWidget
class ChildWidget extends StatelessWidget{
  ChildWidget({Key key, this.active: false, @required this.onChange}):super(key: key);

  final bool active;
  final ValueChanged<bool> onChange;

  void _handleTapChange(){
    onChange(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTapChange,
      child: new Container(
        child: Center(
          child: Text(
            active ? "Active" : "InActive",
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600]
        )
      ),
    );
  }

}


// </editor-fold >

// <editor-fold defaultstate="collapsed" desc="TapBoxC - 混合管理">
class ParentWidgetC extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetCState();
  }

}

class _ParentWidgetCState extends State<ParentWidgetC>{
  bool _active = false;

  void _handleBoxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapBoxC(
        active: _active, onChange: _handleBoxChanged)
    );
  }
  
}
//-----------------------------------------------------
class TapBoxC extends StatefulWidget{
  TapBoxC({Key key, this.active:false, @required this.onChange}):super(key: key);

  final bool active;
  final ValueChanged<bool> onChange;

  @override
  State<StatefulWidget> createState() {
    return new _TapBoxCState();
  }

}

class _TapBoxCState extends State<TapBoxC>{
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap(){
    setState(() {
      widget.onChange(!widget.active);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? "Active" : "Inactive",
            style: new TextStyle(color: Colors.white, fontSize: 32),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? new Border.all(color: Colors.teal[700], width: 10) : null
        ),
      ),
    );
  }

}

// </editor-fold >






///几个常见的widget
///Text文本
///Row水平布局，Column垂直布局
///stack，线性布局，和FrameLayout类似，允许子widget堆叠
///Container，一个矩形容器，可以装饰一个BoxDecoration，如background,阴影
///
/// Material组件，更多Android md风格的组件库，内置了theme等的widget
/// Cupertino组件，更多适应iOS风格的组件库

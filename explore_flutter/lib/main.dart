import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

//      home: DynaimicLabel(),
//      home: AddRemoveView(),
      home: FlutterAnimation(param: '动画参考',),
    );
  }
}




//flutter简单动画
class FlutterAnimationState extends State<FlutterAnimation> with TickerProviderStateMixin {

  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {

    controller = AnimationController(

      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
    curve = CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn
    );
  }

  bool _bfAnim = false;
  void _animation() {

//    setState(() {

      _bfAnim = !_bfAnim;
      if (_bfAnim) {

        controller.forward();
      } else {

        controller.reverse();
      }
//    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold (

      appBar: AppBar(

        title: Text(widget.param),
      ),
      body: Center(

        child: Container(

          child: FadeTransition(opacity: curve, child: FlutterLogo(

            size: 100,
          ),),
        ),
      ),

     floatingActionButton: FloatingActionButton(onPressed: _animation,
       tooltip: '动画',
       child: Icon(Icons.brush),
     ),
    );
  }
}


class FlutterAnimation extends StatefulWidget {

  FlutterAnimation({Key key, this.param}) : super(key : key);

  final String param;
  @override
  FlutterAnimationState createState() => new FlutterAnimationState();
}


//Widget模拟添加移除视图
class AddRemoveViewState extends State<AddRemoveView> {

  bool _isShow = false;

  void _updateShowStatus() {

    setState(() {

      _isShow = !_isShow;
    });
  }

  Widget _getCurrentWidget() {

    if (_isShow) {

      return Text('我是Label');
    }
    return FloatingActionButton(

      child: Text('我是Button'),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      body: Center(

        child: _getCurrentWidget(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _updateShowStatus,
          child: Icon(Icons.update),
      ),
    );
  }
}

class AddRemoveView extends StatefulWidget {

  @override
  AddRemoveViewState createState() => new AddRemoveViewState();
}



//动态可变的UILabel
class DynaimicLabelState extends State<DynaimicLabel> {

  String showText = "1";
  void _updateText() {

    setState(() {

      showText = showText + "1";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(child: Text(showText)),
      floatingActionButton: new FloatingActionButton(

        onPressed: _updateText,
        tooltip: '更新文本',
        child: Icon(Icons.update),
      ),
    );
  }
}

class DynaimicLabel extends StatefulWidget {

  DynaimicLabelState createState() => new DynaimicLabelState();
}
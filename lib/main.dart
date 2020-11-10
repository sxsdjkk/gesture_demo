import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _desc = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _desc = 'tap';
              });
            },
            onDoubleTap: () {
              setState(() {
                _desc = 'double tap';
              });
            },
            onVerticalDragStart: (DragStartDetails details) {
              setState(() {
                _desc = 'drag start';
              });
            },
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _desc = 'drag update';
              });
            },
            onVerticalDragEnd: (DragEndDetails details) {
              setState(() {
                _desc = 'drag end';
              });
            },
            onHorizontalDragStart: (DragStartDetails details) {
              setState(() {
                _desc = 'drag start';
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _desc = 'drag update';
              });
            },
            onHorizontalDragEnd: (DragEndDetails details) {
              setState(() {
                _desc = 'drag end';
              });
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    child: UiKitView(
                      viewType: "platform_view_test",
                      hitTestBehavior: PlatformViewHitTestBehavior.transparent,
                      creationParamsCodec: const StandardMessageCodec(),
                    ),
                  ),
                  Align(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Please drag the background',
                        ),
                        Text(
                          _desc,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

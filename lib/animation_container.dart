import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({Key? key}) : super(key: key);

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  double _width = 400;
  double _topMargin = 0;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      width: _width,
      margin: EdgeInsets.only(top: _topMargin),
      color: Colors.lightBlueAccent,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _width = 100;
            _topMargin = 200;
            _opacity = 0.5;
          });
        },
        child: Opacity(opacity: _opacity,
        child: Center(child: Text("Press to see magic"))),
      ),
    );
  }
}

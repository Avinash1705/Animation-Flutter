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
    return TweenAnimationBuilder(
        duration: Duration(seconds: 4),
       // curve: Curves.bounceInOut,                                  //define curve in implicit animation
        tween: Tween<double>(begin: 0,end: 100),
        builder: (BuildContext context, double value, Widget? child) {
          return Container(
              margin: EdgeInsets.only(left: value),
            decoration: BoxDecoration(
              color: Colors.green,
              
            ),
            child: Opacity(opacity: 1,child: Padding(
              padding: EdgeInsets.all(value),
              child:child ,
            ),),
          );
        },
        child: Center(child: Text("Press to see magic",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.red,fontSize:25),)));
  }
}

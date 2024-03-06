import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  // var mycolor = Colors.grey[400];
  late AnimationController _animationController;
  late Animation _colorAnimation;
  late Animation _sizeAnimation;
  bool isFav = false;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_animationController);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 30,end:50), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 50,end:30), weight: 50)
    ]).animate(_animationController);

    _animationController.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      } else if(status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            size: _sizeAnimation.value,
            color: _colorAnimation.value,
          ),
          onPressed: () {
            setState(() {
              // mycolor = Colors.yellow;
              print(isFav);
              isFav
                  ? _animationController.reverse()
                  : _animationController.forward( );
            });
          },
        );
      },
    );
  }
}

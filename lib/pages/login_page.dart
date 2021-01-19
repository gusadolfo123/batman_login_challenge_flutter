import 'package:flutter/material.dart';

const height_logo = 52.0;
const width_logo = 100.0;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  Animation<double> animationPosition;
  double _opacity = 1;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();

    // animation = new CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // );

    animation = Tween(begin: 40.0, end: 1.0).animate(_controller);
    animationPosition = Tween(begin: 0.0, end: 20.0).animate(_controller);

    _controller.addListener(() {
      // setState(() {
      //   _opacity = 1 - _controller.value;
      // });
      print("animation: " + _controller.value.toString());
      print("animationPosition: " + animation.value.toString());
      print("controller: " + animationPosition.value.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Image(
              width: _size.width,
              image: AssetImage("assets/batman_background.png"),
            ),
          ),
          Positioned(
            top: (_size.height * 0.5) - (height_logo / 2),
            left: (_size.width * 0.5) - (width_logo / 2),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: animation.value,
                  child: Transform.translate(
                    offset: Offset(0, 100),
                    child: child,
                  ),
                );
              },
              child: Opacity(
                opacity: _opacity,
                child: Image(
                  width: width_logo,
                  height: height_logo,
                  image: AssetImage("assets/batman_logo.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

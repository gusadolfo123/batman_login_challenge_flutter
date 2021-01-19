import 'dart:ffi';

import 'package:flutter/material.dart';

const height_logo = 52.0;
const width_logo = 100.0;
const position = 40.0;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  Animation<double> animationPosition;
  Animation<double> animationScale;

  AnimationController _controllerText;
  Animation<double> animationTextPosition;
  Animation<double> animationOpacity;

  AnimationController _controllerLogo;
  Animation<double> animationScaleLogo;

  AnimationController _controllerInputs;
  Animation<double> animationInputPosition;
  Animation<double> animationInputOpacity;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _controllerText = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _controllerLogo = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _controllerInputs = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animationScaleLogo = Tween<double>(begin: 10.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerLogo,
        curve: Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );

    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controllerText,
        curve: Interval(
          0.7,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    // animationTextPosition =
    //     Tween(begin: 100.0, end: 0.0).animate(CurvedAnimation(
    //   parent: _controllerText,
    //   curve: Interval(
    //     0.6,
    //     1.0,
    //     curve: Curves.easeIn,
    //   ),
    // ));

    // List<TweenSequenceItem<double>> items = [
    //   TweenSequenceItem(
    //     tween: Tween<double>(begin: 40.0, end: 0.0),
    //     weight: 5.0,
    //   ),
    //   TweenSequenceItem(
    //     tween: Tween<double>(begin: 0.0, end: 40.0),
    //     weight: 1.0,
    //   ),
    // ];

    // animation = TweenSequence(items).animate(_controller);
    // animation = Tween(begin: 40.0, end: 1.0).animate(_controller);

    animationScale = Tween<double>(begin: 40.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.3, curve: Curves.ease),
      ),
    );

    animationPosition = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
    _controllerText.forward();
    _controllerLogo.forward();
    _controllerInputs.forward();

    super.initState();
  }

  @override
  void dispose() {
    // _controller?.dispose();
    // _controllerText?.dispose();
    // _controllerLogo?.dispose();
    // _controllerInputs?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Image(
              width: _size.width,
              image: AssetImage("assets/batman_background.png"),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: 0,
                child: Transform.scale(
                  scale: animationScaleLogo.value,
                  child: child,
                ),
              );
            },
            child: Container(
              width: 500,
              height: 500,
              child: Image(
                image: AssetImage("assets/batman_alone.png"),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                top: (_size.height * 0.5) -
                    (height_logo / 2) -
                    animationPosition.value +
                    position,
                left: (_size.width * 0.5) - (width_logo / 2),
                child: Transform.scale(
                  scale: animationScale.value,
                  child: child,
                ),
              );
            },
            child: Container(
              width: width_logo,
              height: height_logo,
              child: Image(
                image: AssetImage("assets/batman_logo.png"),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _controllerText,
            builder: (context, child) {
              return Positioned(
                top: (_size.height * 0.5) - (height_logo / 2) + 40,
                child: Opacity(
                  opacity: animationOpacity.value,
                  child: child,
                ),
              );
            },
            child: Column(
              children: [
                Text(
                  "WELCOME TO",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "GOTHAM CITY",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  "phkaj sdjfh  fhksjdfhkjsdhwerj whejrkh asdad asd",
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            bottom: 40,
            duration: Duration(seconds: 1),
            child: Column(
              children: [
                Container(
                  height: 54,
                  width: _size.width - 80,
                  child: RaisedButton(
                    color: Colors.orange[300],
                    onPressed: () {},
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 54,
                  margin: EdgeInsets.only(top: 20),
                  width: _size.width - 80,
                  child: RaisedButton(
                    color: Colors.orange[300],
                    onPressed: () {},
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

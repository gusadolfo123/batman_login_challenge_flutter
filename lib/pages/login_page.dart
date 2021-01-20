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

  Animation<double> animationTextPosition;
  Animation<double> animationOpacity;

  Animation<double> animationScaleBatman;

  Animation<double> animationInputPosition;
  Animation<double> animationInputOpacity;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animationScaleBatman = Tween<double>(begin: 4.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1.0, curve: Curves.easeIn),
      ),
    );

    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.75, curve: Curves.easeIn),
      ),
    );

    animationScale = Tween<double>(begin: 26.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.25, curve: Curves.ease),
      ),
    );

    animationPosition = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.75, curve: Curves.easeOut),
      ),
    );

    _controller?.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Material(
      child: InkWell(
        onTap: () {
          _controller.forward(from: 0.0);
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/batman_background.png",
                      width: _size.width,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Transform.scale(
                      scale: animationScaleBatman.value,
                      child: Image.asset(
                        "assets/batman_alone.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: (_size.height * 0.5) -
                        (height_logo / 2) -
                        animationPosition.value +
                        position,
                    left: (_size.width * 0.5) - (width_logo / 2),
                    child: Transform.scale(
                      scale: animationScale.value,
                      child: Image.asset(
                        "assets/batman_logo.png",
                        width: width_logo,
                        height: height_logo,
                      ),
                    ),
                  ),
                  Positioned(
                    top: (_size.height * 0.5) - (height_logo / 2) + 40,
                    child: Opacity(
                      opacity: animationOpacity.value,
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
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 12),
                          ),
                          const SizedBox(height: 80),
                          Column(
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

double deviceSize(BuildContext context) => MediaQuery.of(context).size.width;

class Home extends StatelessWidget {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff16192A),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.green,
              child: Center(
                child: Text(
                  'GeeksforGeeks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            isDesktop(context)
                ? Desktop()
                : isTablet(context)
                    ? Tablet()
                    : Mobile()
          ],
        ),
      ),
    );
  }
}

class Mobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Mobile ${deviceSize(context).toInt()}'));
  }
}

class Tablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Tablet ${deviceSize(context).toInt()}'));
  }
}

class Desktop extends StatefulWidget {
  @override
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  Color bg;
  Color textColor = Colors.orange;
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      bg = null;
      textColor = Colors.orange;
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      bg = Color(0xff452C2F);
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: bg, //when hovered text color change
            shape: BoxShape.rectangle),
        child: GestureDetector(
          onTap: () {},
          child: Text(
            "Log in",
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

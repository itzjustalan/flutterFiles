import 'package:flutter/material.dart'​;​

void main() {
  runApp(MyApp());}class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }}class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();}class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text('Show / Hide'),
              onPressed: () {
                switch (controller.status) {
                  case AnimationStatus​.​completed​:
                    controller.reverse();
                    break;
                  case AnimationStatus​.​dismissed​:
                    controller.forward();
                    break;
                  default:
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: offset,
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: CircularProgressIndicator​(),
              ),
            ),
          )
        ],
      ),
    );
  }}
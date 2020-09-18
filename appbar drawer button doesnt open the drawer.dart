//appbar drawer button doesnt open the drawer


import "package:flutter/material.dart";


class Test extends StatefulWidget {
  @override
  _TestState createState() => new _TestState();
}


class _TestState extends State<Test> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new Drawer(),
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.settings),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
    );
  }
}

 import 'package:flutter/material.dart';

class DynamicTabContent {
  IconData icon;
  String tooTip;

  DynamicTabContent.name(this.icon, this.tooTip);
}

class CardStack extends StatefulWidget {
  @override
  _MainState createState() => new _MainState();
}

class _MainState extends State<CardStack> with TickerProviderStateMixin {
  List<DynamicTabContent> myList = new List();

  TabController _cardController;

  TabPageSelector _tabPageSelector;

  @override
  void initState() {
    super.initState();

    myList.add(new DynamicTabContent.name(Icons.favorite, "Favorited"));
    myList.add(new DynamicTabContent.name(Icons.local_pizza, "local pizza"));

    _cardController = new TabController(vsync: this, length: myList.length);
    _tabPageSelector = new TabPageSelector(controller: _cardController);
  }

  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: new AppBar(
          actions: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(1.0),
              child: new IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 30.0,
                  color: Colors.white,
                ),
                tooltip: 'Add Tabs',
                onPressed: () {
                  List<DynamicTabContent> tempList = new List();

                  myList.forEach((dynamicContent) {
                    tempList.add(dynamicContent);
                  });

                  setState(() {
                    myList.clear();
                  });

                  if (tempList.length % 2 == 0) {
                    myList.add(new DynamicTabContent.name(Icons.shopping_cart, "shopping cart"));
                  } else {
                    myList.add(new DynamicTabContent.name(Icons.camera, "camera"));
                  }

                  tempList.forEach((dynamicContent) {
                    myList.add(dynamicContent);
                  });

                  setState(() {
                    _cardController = new TabController(vsync: this, length: myList.length);
                    _tabPageSelector = new TabPageSelector(controller: _cardController);
                  });
                },
              ),
            ),
          ],
          title: new Text("Title Here"),
          bottom: new PreferredSize(
              preferredSize: const Size.fromHeight(10.0),
              child: new Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.grey),
                child: myList.isEmpty
                    ? new Container(
                        height: 30.0,
                      )
                    : new Container(
                        height: 30.0,
                        alignment: Alignment.center,
                        child: _tabPageSelector,
                      ),
              ))),
      body: new TabBarView(
        controller: _cardController,
        children: myList.isEmpty
            ? <Widget>[]
            : myList.map((dynamicContent) {
                return new Card(
                  child: new Container(
                      height: 450.0,
                      width: 300.0,
                      child: new IconButton(
                        icon: new Icon(dynamicContent.icon, size: 100.0),
                        tooltip: dynamicContent.tooTip,
                        onPressed: null,
                      )),
                );
              }).toList(),
      ),
    );
  }
}
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'auth.dart';
import 'cart.dart';

class ServiceCard {
  String imgp;
  String fname;
  ServiceCard.name(this.imgp, this.fname);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final dbref = FirebaseDatabase.instance.reference();
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<ServiceCard> services = [];
  FirebaseUser user;
  var uname = 'Nala';
  var hname = '';

  @override
  void initState() {
    super.initState();
    getuser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _navigateToCart() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => CardStack()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: Text('Nala'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          splashColor: Colors.white,
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
            //Scaffold.of(context).openDrawer();
            getuser();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            splashColor: Colors.white,
            onPressed: () {
              //_navigateToCart();
            },
          ),
        ],
      ),
      body: bilbody(),
      drawer: gendrawer(),
    );
  }

  gendrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('$hname'),
            accountEmail: Text("$uname"),
            decoration: BoxDecoration(color: Colors.white),
          ),
          ListTile(
            title: Text("Ttem 1"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              authService.signOut();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, String hh) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Carousel $hh'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }

  getuser() async {
    user = await auth.currentUser().then((user) {
      setState(() {
        this.user = user;
        if (user != null) {
          uname = user.displayName;
          hname = 'Hi,';
        } else {
          uname = 'Nala';
          hname = '';
        }
      });
    });
  }

  bilbody() {
    final dservices = dbref.child('Services');
    List llists = [];
    var imgpt;
    var fnamet;
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: FutureBuilder(
            future: dservices.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                Map values = snapshot.data.value;
                //values.forEach((key, values) {
                for (var i = 1; i < 4; i++) {
                  //llists.add(values);
                  imgpt = values["Biriyanis"][i]['imgp'] as String;
                  fnamet = values["Biriyanis"][i]['name'] as String;
                  llists.add(new ServiceCard.name(imgpt, fnamet));
                  print('>__');
                  print(imgpt + fnamet);
                  print(llists);
                }
                return new ListView.builder(
                  //padding: EdgeInsets.symmetric(vertical: 100),
                  //scrollDirection: Axis.vertical,
                  //shrinkWrap: true,
                  itemCount: llists.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.red[300],
                        height: 200,
                        child: Text('Welcome to nala-'),
                      );
                      //return _buildCarousel(context, index * 2);
                    } else if (index % 2 != 0) {
                      print(index);
                      return _buildCarousel(
                        context,
                        //llists[index],
                        'jhguyf'
                      );
                    } else {
                      return Divider(
                        height: 0,
                        //thickness: 0,
                        //indent: 32,
                        //endIndent: 42,
                      );
                    }
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}

/*

  bilbody() {
    return Column(
      children: <Widget>[
        Container(
          //height: 120,
          color: Colors.red[200],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: ListView.builder(
            //scrollDirection: Axis.vertical,
            //shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 100),
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  height: 200,
                  child: Text('Welcome container-'),
                );
                //return _buildCarousel(context, index * 2);
              } else if (index % 2 != 0) {
                print(index);
                return _buildCarousel(context, 'sfksdf');
              } else {
                return Divider(
                  height: 0,
                  //thickness: 0,
                  //indent: 32,
                  //endIndent: 42,
                );
              }
            },
          ),
        ),
      ],
    );
  }


*/

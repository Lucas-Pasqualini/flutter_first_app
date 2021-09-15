import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
            centerTitle: true,
        bottom: const TabBar(
          tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
    ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(
            height: 50,
            child: Column(
              children: const <Widget>[
              Text('Left Hand of Darkness', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Ursula K. Le GUin'),
            ],)
          ),
          SizedBox(
              height: 50,
              child: Column(
                children: const <Widget>[
                  Text('Kindred', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Octavia E. Butler'),
                ],)
          ),
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Books',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Authors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'all_characters_res.dart';

class DisplayCharacter extends StatelessWidget {
  const DisplayCharacter({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true),
        backgroundColor: Colors.grey,
        body: Center(
            child: Container(
                width: 300,
            child: Column(children: [
          Image.network(character.image ?? ""),
          IconButton(icon: const Icon(Icons.add, color: Colors.red,), onPressed: () {

          },),
          Expanded(
              child: ListView(children: [
            CustomContainer(title: 'Status', value: 'Rare'),
            CustomContainer(title: 'Specifies', value: 'fse'),
            CustomContainer(title: 'Gender', value: 'fes'),
            CustomContainer(title: 'Origin', value: 'fes'),
            CustomContainer(title: 'LastLocation', value: 'fsegsg'),
                const Divider(color: Colors.white),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.white
                    ),
                    Column(
                      children: const [
                        Text("Lank"),
                        Text("S02E000")
                      ],
                    ),
                  ]
                ),
                const Text("date", textAlign: TextAlign.end),
                const Divider(color: Colors.white),
          ])),
        ]))));
  }
}

class CustomContainer extends StatelessWidget {
  CustomContainer({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Text(title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      Text(value, style: const TextStyle(color: Colors.orange, fontSize: 20))
    ]);
  }
}

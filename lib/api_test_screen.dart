import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m2_flutter/display_one_character.dart';

import 'all_characters_res.dart';

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({Key? key}) : super(key: key);

  @override
  _ApiTestScreenState createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {

  All_characters_res? allChar;
  List <Character> _characters = [];

  Future<void> getAllCharacters() async {
    var uri = Uri.parse('https://rickandmortyapi.com/api/character');

    var responseFromApi = await http.get(uri);
    if (responseFromApi.statusCode==200){
      setState((){
        allChar = All_characters_res.fromJson(jsonDecode(responseFromApi.body));
        _characters = allChar!.results;
      });
    }
  }

  Widget? _getBuddy() {
    if(_characters.isNotEmpty) {
      return ListView.separated(
          separatorBuilder: (BuildContext context, int index ) => const Divider (),
          itemCount: _characters.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text (_characters[index].name ?? "Vide"),
              leading : Image.network(_characters[index].image ?? ""),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DisplayCharacter(character: _characters[index]))
                );
              },
            );
          }
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API"),
      ),
      body: _getBuddy(),
      floatingActionButton: FloatingActionButton(
        onPressed: getAllCharacters,
        tooltip: 'api',
        child: const Icon(Icons.add),
      ),
      );
  }
}

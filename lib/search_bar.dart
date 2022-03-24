import "package:flutter/material.dart";
import 'package:flutter/services.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "What movie do you want do search?"),
    );
  }
}

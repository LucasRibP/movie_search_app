import "package:flutter/material.dart";

class SearchBar extends StatefulWidget {
  final Function onTextChange;

  const SearchBar({Key? key, required this.onTextChange}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final inputController = TextEditingController();

  @override
  void initState() {
    inputController.addListener(() {
      widget.onTextChange(inputController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

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

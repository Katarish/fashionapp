import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget{
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  SearchField({
   required this.controller,
    required this.onChanged,
});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Search..',
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.black),
      onChanged: onChanged,
      autofocus: true,
    );
  }

}
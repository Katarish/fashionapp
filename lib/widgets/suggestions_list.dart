import 'package:flutter/material.dart';

class SuggestionsList extends StatelessWidget{

  final List<String> suggestions;
  final ValueChanged<String> onTap;

  SuggestionsList({
    required this.suggestions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: suggestions.map((suggestion) {
          return ListTile(
            title: Text(suggestion),
            onTap: () => onTap(suggestion),
          );
        }).toList(),
      ),
    );
  }
}
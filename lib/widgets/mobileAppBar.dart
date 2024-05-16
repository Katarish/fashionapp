import 'package:fashionapp/widgets/search_field.dart';
import 'package:fashionapp/widgets/suggestions_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;

  MobileAppBar({required this.scaffoldkey});

  @override
  _MobileAppBar createState() => _MobileAppBar();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MobileAppBar extends State<MobileAppBar> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = ['Apple', 'Banana', 'Cherry', 'Date', 'Elderberry'];
  List<String> _filteredSuggestions = [];

  void _filterSuggestions(String query) {
    setState(() {
      _filteredSuggestions = _suggestions
          .where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink.shade50,
      //elevation: 20,
      title: _isSearching
          ? SearchField(controller: _searchController, onChanged: _filterSuggestions)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Shaanvi',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                Text('A Boutique for Theme Designs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
              ],
            ),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: (){
          widget.scaffoldkey.currentState?.openDrawer();
        },
      ),
      actions: [
        _isSearching
          ? IconButton(onPressed: (){
            setState(() {
              _isSearching = false;
              _searchController.clear();
              _filteredSuggestions.clear();
            });
        }, icon: Icon(Icons.close))
            : IconButton(onPressed: (){
              setState(() {
                _isSearching = true;
              });
        }, icon: Icon(Icons.search)),
        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
      ],
      bottom: _isSearching
          ? PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: Container(
          color: Colors.white,
          height: 200.0,
          child: SuggestionsList(
            suggestions: _filteredSuggestions,
            onTap: (suggestion) {
              setState(() {
                _searchController.text = suggestion;
                _isSearching = false;
                _filteredSuggestions.clear();
              });
            },
          ),
        ),
      )
          : null,
    );
  }
}

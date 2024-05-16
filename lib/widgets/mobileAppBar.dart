import 'suggestions_list.dart';
import 'package:flutter/material.dart';
import 'search_field.dart';

class MobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  MobileAppBar({required this.scaffoldKey});

  @override
  _MobileAppBarState createState() => _MobileAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MobileAppBarState extends State<MobileAppBar> {
  //bool _isSearching = false;
  //TextEditingController _searchController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Center(child: Text('Shaanvi')),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          widget.scaffoldKey.currentState?.openDrawer();
        },
      ),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: (){
          showSearch(context: context, delegate: MySearchDelegate(),);
        },)
      ],
    );
  }
}

class MySearchDelegate extends SearchDelegate{
  List<String> searchresults = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: (){
          if(query.isEmpty){
            close(context, null);
          }else{
            query = '';
          }

          },
        icon: Icon(Icons.clear))
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), //close search bar
      icon: Icon(Icons.arrow_back)
  );

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> _suggestions = searchresults.where((searchresults) =>
        searchresults.toLowerCase().contains(query.toLowerCase()))
        .toList();



    return ListView.builder(
        itemCount: _suggestions.length,
        itemBuilder: (context,index){
          final suggestion = _suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: (){
              query = suggestion;

              showResults(context);
            },
          );
        });

  }
}

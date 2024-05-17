import 'package:flutter/material.dart';

class DesktopAppBar extends StatefulWidget implements PreferredSizeWidget{

  @override
  _DesktopAppBar createState() => _DesktopAppBar();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _DesktopAppBar extends State<DesktopAppBar> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shaanvi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pinkAccent),),
              Text('A boutique for Theme Based Designs',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.pinkAccent),),
            ],
          ),
          Container(
            width: 200,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none
              ),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
          ],
        )
      ],


    );
  }
}
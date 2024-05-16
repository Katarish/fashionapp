import 'package:flutter/material.dart';

class DesktopAppBar extends StatefulWidget implements PreferredSizeWidget{

  @override
  State<DesktopAppBar> createState() => _DesktopAppBar();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}

class _DesktopAppBar extends State<DesktopAppBar> {
 // bool _isSearching = false;
  TextEditingController _searchController  = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Colors.pink.shade50,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shaanvi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              Text('A Boutique for Theme Designs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),),
            ],
          ),
          Container(
            width: 300,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search..",
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none
              ),
            ),
          )
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
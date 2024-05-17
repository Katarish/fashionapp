import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Drawer(
     child: ListView(
       children: [
         DrawerHeader(child: Text('Menu')),
         ListTile(title: Text('Home')),
         ListTile(title: Text('Profile')),
         ListTile(title: Text('Settings')),
       ],
     ),
   );
  }

}
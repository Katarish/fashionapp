import 'package:fashionapp/Widgets/desktopAppBar.dart';
import 'package:fashionapp/Widgets/mobileAppBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var _appBar ;
    if(screenWidth >= 600){
      _appBar = DesktopAppBar();
    }else{
      _appBar = MobileAppBar(scaffoldKey: _scaffoldKey,);
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar,
      drawer: screenWidth < 600
          ? Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menu')),
            ListTile(title: Text('Home')),
            ListTile(title: Text('Profile')),
            ListTile(title: Text('Settings')),
          ],
        ),
      )
          : null,
      body:SingleChildScrollView(
          child: Container(
            height: 400,
              color: Colors.pink.shade50,
              child: Text("hello"))
      )
    );
  }
}

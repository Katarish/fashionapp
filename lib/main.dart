import 'package:fashionapp/widgets/desktopAppBar.dart';
import 'package:fashionapp/widgets/mobileAppBar.dart';
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
      title: 'Shaanvi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Shaanvi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    var _appBar;

    if(screenWidth >= 600){
      _appBar = DesktopAppBar();
    }else{
      _appBar = MobileAppBar(scaffoldkey: _scaffoldKey);
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
        ) : null,
      body: Text('Hello Fashion : $screenWidth') // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

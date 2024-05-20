import 'package:fashionapp/Widgets/collections_widget.dart';
import 'package:fashionapp/Widgets/desktopAppBar.dart';
import 'package:fashionapp/Widgets/hanspicked_edit.dart';
import 'package:fashionapp/Widgets/mobileAppBar.dart';
import 'package:fashionapp/widgets/appDrawer.dart';
import 'package:fashionapp/widgets/image_carousel.dart';
import 'package:fashionapp/widgets/on_sale.dart';
import 'package:fashionapp/widgets/zoom_on_image_hover.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        //extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: _appBar,
      drawer: screenWidth < 600
          ? AppDrawer()
          : null,
      body:SingleChildScrollView(
          child: Column(
            children: [
              ImageCarousel(screenWidth: screenWidth,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: MyCollections(),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: MyHandpicked(),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OnSale(),
              ),

              //ImageCarousel(screenWidth: screenWidth,),
            ],
          )
      )
    );
  }
}

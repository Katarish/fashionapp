import 'dart:async';

import 'package:flutter/material.dart';

class MyHandpicked extends StatefulWidget{

  @override
  _MyHandpickedState createState() => _MyHandpickedState();
}

class _MyHandpickedState extends State<MyHandpicked> {


  final ScrollController _scrollController = ScrollController();
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer=Timer.periodic(Duration(seconds: 2), _scrollList);
  }

  void _scrollList(Timer timer) {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      final delta = 240.0; // Scroll by 200 pixels

      if (currentScroll < maxScroll) {
        _scrollController.animateTo(
          currentScroll + delta,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      } else {
        _scrollController.animateTo(
          0.0,
          duration: Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    List itemList = [
      {"id": "1", "tag": "BEST SELLERS", "image_path": 'assets/images/1.webp',"price": "2000"},
      {"id": "2", "tag": "PARTY WEAR", "image_path": 'assets/images/2.webp',"price": "2200"},
      {"id": "3", "tag": "NEW ARRIVAL", "image_path": 'assets/images/3.webp',"price": "2500"},
      {"id": "4", "tag": "CASUAL WEAR", "image_path": 'assets/images/4.webp',"price": "1800"},
      {"id": "5", "tag": "ONGOING SALE", "image_path": 'assets/images/3.webp',"price": "3000"},
      {"id": "6", "tag": "OFFICE WEAR", "image_path": 'assets/images/4.webp',"price": "2100"},
      {"id": "7", "tag": "NEW ARRIVAL", "image_path": 'assets/images/3.webp',"price": "2500"},
      {"id": "8", "tag": "CASUAL WEAR", "image_path": 'assets/images/4.webp',"price": "1800"},
      {"id": "9", "tag": "ONGOING SALE", "image_path": 'assets/images/3.webp',"price": "3000"},
      {"id": "10", "tag": "OFFICE WEAR", "image_path": 'assets/images/4.webp',"price": "2100"}
    ];
    final _screenwidth = MediaQuery.of(context).size.width;
    final _screenheight = MediaQuery.of(context).size.height;

   return Container(
     height: 450,
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         SizedBox(height: 11,),
         Center(child: Text("Shaanvi's Handpicked", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
         SizedBox(height: 20,),
         Container(
           height: 350,
           child: ListView.builder(
               controller: _scrollController,
               scrollDirection: Axis.horizontal,
               itemCount: itemList.length,
               itemBuilder: (context,index){
                 return Container(
                   width: 220,
                   margin: EdgeInsets.all(10.0),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     color: Colors.grey.shade100
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                           child: Image.asset(itemList[index]["image_path"],
                             fit: BoxFit.cover, height: 270, width: 220,)
                       ),
                       SizedBox(height: 11,),
                       Text(
                         itemList[index]["tag"],
                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                       ),
                       SizedBox(height: 4,),
                       Text(
                         "\u{20B9} "+itemList[index]["price"],
                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                       )

                     ],

                   ),
                 );
               }
           ),
         ),
       ],
     ),


   );
  }


}
import 'package:flutter/material.dart';

class MyCollections extends StatelessWidget {

  List itemList = [
    {"id": "1", "tag": "BEST SELLERS", "image_path": 'assets/images/1.webp'},
    {"id": "2", "tag": "PARTY WEAR", "image_path": 'assets/images/2.webp'},
    {"id": "3", "tag": "NEW ARRIVAL", "image_path": 'assets/images/3.webp'},
    {"id": "4", "tag": "CASUAL WEAR", "image_path": 'assets/images/4.webp'},
    {"id": "5", "tag": "ONGOING SALE", "image_path": 'assets/images/3.webp'},
    {"id": "6", "tag": "OFFICE WEAR", "image_path": 'assets/images/4.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    final _screenwidth = MediaQuery.of(context).size.width;
    final _screenheight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.pink.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 11,),
          Center(child: Text('Collections by Shaanvi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          Center(
              child: Container(
                width:_screenwidth/1.5,
                child: Text("Step into elegance, embrace tradition. Our ethnic wear is not just fashion; "
                "it's a celebration of womanhood, where style meets culture effortlessly.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontStyle: FontStyle.italic,fontSize: 14,color: Colors.grey.shade600),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              height: _screenheight/2.5,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: itemList.map((item) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //width: 100,
                    //height: 100,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: _screenwidth/10 < 80 ? _screenwidth/10: 80,
                          backgroundColor: Colors.pinkAccent,
                          child: CircleAvatar(
                            radius: _screenwidth/10 - 5 < 75 ? _screenwidth/10-5: 75,
                            backgroundImage: AssetImage(item["image_path"]),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(item["tag"], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              }).toList()))
        ],
      ),
    );
  }
}

import 'package:fashionapp/widgets/zoom_on_image_hover.dart';
import 'package:flutter/material.dart';

class OnSale extends StatefulWidget{

  @override
  _OnSaleState createState() => _OnSaleState();
}

class _OnSaleState extends State<OnSale> {
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

    final ScrollController _scrollController = ScrollController();\
    bool _isHovering = false;

    void _scrollLeft() {
      _scrollController.animateTo(
        _scrollController.offset - 200, // Adjust the value as needed
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    void _scrollRight() {
      _scrollController.animateTo(
        _scrollController.offset + 200, // Adjust the value as needed
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Container(
      height: 550,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 11,),
          Center(child: Text("Currently on Sale", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          SizedBox(height: 20,),
          Container(
            height: 450,
            child:MouseRegion(
              onEnter: (_) => setState(() => _isHovering = true),
              onExit: (_) => setState(() => _isHovering = false),
              child:  ListView.builder(
                      controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                      itemCount: itemList.length,
                      itemBuilder: (context,index){
                        return Container(
                          width: 220,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.shade100
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ImageZoomOnHover(imageUrl: itemList[index]["image_path"],),
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
                      }),
                  ),

            ),

            ),

        ],
      ),
    );
  }
}
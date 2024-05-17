import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget{
  final screenWidth;

  ImageCarousel({required this.screenWidth});

  @override
  _ImageCarousel createState() => _ImageCarousel();

}

class _ImageCarousel extends State<ImageCarousel> {
  final CarouselController carouselController = CarouselController();
  List imageListMobile = [
    {"id":"1", "image_path":'assets/images/1.webp'},
    {"id":"2", "image_path":'assets/images/2.webp'},
    {"id":"3", "image_path":'assets/images/3.webp'},
    {"id":"4", "image_path":'assets/images/4.webp'},
  ];

  List imageListDesktop = [
    {"id":"1", "image_path":'assets/images/d1.webp'},
    {"id":"2", "image_path":'assets/images/d2.webp'},
    {"id":"3", "image_path":'assets/images/d3.webp'},
    {"id":"4", "image_path":'assets/images/d4.webp'},
  ];

  List imageList = [];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    if(widget.screenWidth < 600){
      imageList = imageListMobile;
    }else{
      imageList = imageListDesktop;
    }

    return Stack(
      children: [
        InkWell(
          onTap: (){},
          child: CarouselSlider(
            items: imageList.map((item) => Image.asset(
              item['image_path'],
              fit: BoxFit.fill,
              width: double.infinity,
            )).toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: widget.screenWidth < 600 ? 1 : 16/6,
              viewportFraction: 1,
              autoPlayInterval: Duration(seconds: 2),
              onPageChanged: (index,reason){
                setState(() {
                  currentIndex = index;
                });
              }
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: imageList.length,
                effect: ExpandingDotsEffect(
                  dotWidth: 12,
                  dotHeight: 12,
                  dotColor: Colors.white.withOpacity(0.6),
                  activeDotColor: Colors.pink
                ),
              ),
            ),

        )
      ],
    );
  }
}
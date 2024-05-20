import 'package:flutter/material.dart';

class ImageZoomOnHover extends StatefulWidget{
  final String imageUrl;

  const ImageZoomOnHover({required this.imageUrl});


  @override
  _ImageZoomOnHoverState createState() => _ImageZoomOnHoverState();
}

class _ImageZoomOnHoverState extends State<ImageZoomOnHover> {
  bool _isHovering = false;


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) =>  _onHover(true),
      onExit: (_) =>  _onHover(false),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        transform: _isHovering ?_zoomedMatrix() : Matrix4.identity(),
        child: Image.asset(widget.imageUrl),
      ),
    );
  }

  Matrix4 _zoomedMatrix() {
    return Matrix4.identity()..scale(1.2);
  }

  void _onHover(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
  }
}



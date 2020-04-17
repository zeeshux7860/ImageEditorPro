import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final File file;

  const ImageView({Key key, this.file}) : super(key: key);
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Image.file(widget.file),
      ),
    );
  }
}

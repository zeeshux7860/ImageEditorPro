import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_editor_pro/image_editor_pro.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getimageditor() {
    final geteditimage =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ImageEditorPro(
        appBarColor: Colors.blue,
        bottomBarColor: Colors.blue,
      );
    })).then((geteditimage) {
      if (geteditimage != null) {
        setState(() {
          _image = geteditimage;
        });
      }
    }).catchError((er) {
      print(er);
    });
  }

  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Editor Pro example'),
      ),
      body: _image == null
          ? Center(
              child: RaisedButton(
                onPressed: () {
                  getimageditor();
                },
                child: new Text("Open Editor"),
              ),
            )
          : Center(
              child: Image.file(_image),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {
          _image = null;
          setState(() {});
        },
      ),
    );
  }
}

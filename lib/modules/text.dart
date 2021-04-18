import 'package:firexcode/firexcode.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextEditorImage extends StatefulWidget {
  @override
  _TextEditorImageState createState() => _TextEditorImageState();
}

class _TextEditorImageState extends State<TextEditorImage> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return xColumnSC
        .list([
          TextField(
            controller: name,
            decoration: InputDecoration(
              hintText: 'Insert your message',
              hintStyle: TextStyle(color: Colors.white),
              alignLabelWithHint: true,
            ),
            scrollPadding: EdgeInsets.all(20.0),
            keyboardType: TextInputType.multiline,
            maxLines: 99999,
            style: TextStyle(
              color: Colors.white,
            ),
            autofocus: true,
          )
        ])
        .xSingleChildScroolView()
        .xCenter()
        .xScaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: <Widget>[
              Icon(FontAwesomeIcons.alignLeft).xIconButton(onPressed: () {}),
              Icon(FontAwesomeIcons.alignCenter).xIconButton(onPressed: () {}),
              Icon(FontAwesomeIcons.alignRight).xIconButton(onPressed: () {}),
            ],
          ),
          bottomNavigationBar: 'Add Text'
              .xTextColorWhite(
                fontWeight: FontWeight.bold,
                fontsize: 22,
              )
              .xFlatButton(
                onPressed: () {
                  Navigator.pop(context, name.text);
                },
                color: Colors.black,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              )
              .xContainer(
                color: Colors.white,
              ),
        );
  }
}

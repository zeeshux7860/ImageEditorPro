import 'package:firexcode/firexcode.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'colors_picker.dart';

class TextEditorImage extends StatefulWidget {
  @override
  _TextEditorImageState createState() => _TextEditorImageState();
}

class _TextEditorImageState extends State<TextEditorImage> {
  TextEditingController name = TextEditingController();
  Color currentColor = Colors.black;
  double slider = 12.0;
  @override
  Widget build(BuildContext context) {
    return xColumn
        .list([
          TextField(
            controller: name,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
              hintText: 'Insert Your Message',
              hintStyle: TextStyle(color: Colors.white),
              alignLabelWithHint: true,
            ),
            scrollPadding: EdgeInsets.all(20.0),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 99999,
            style: TextStyle(
              color: Colors.white,
            ),
            autofocus: true,
          ).toContainer(height: xheight(context) / 2.2),
          xColumnCC.list([
            //   20.0.sizedHeight(),
            'Slider Color'.text(),
            //   10.0.sizedHeight(),
            xRowCC.list([
              BarColorPicker(
                  width: 300,
                  thumbColor: Colors.white,
                  cornerRadius: 10,
                  pickMode: PickMode.Color,
                  colorListener: (int value) {
                    setState(() {
                      currentColor = Color(value);
                    });
                  }).xExpanded(),
              'Reset'.text().xFlatButton(onPressed: () {})
            ]),
            //   20.0.sizedHeight(),
            'Slider White Black Color'.text(),
            //   10.0.sizedHeight(),
            xRowCC.list([
              BarColorPicker(
                  width: 300,
                  thumbColor: Colors.white,
                  cornerRadius: 10,
                  pickMode: PickMode.Grey,
                  colorListener: (int value) {
                    setState(() {
                      currentColor = Color(value);
                    });
                  }).xExpanded(),
              'Reset'.text().xFlatButton(onPressed: () {})
            ]),
            xColumn.list([
              10.0.sizedHeight(),
              'Size Adjust'.toUpperCase().xTextColorWhite().toCenter(),
              10.0.sizedHeight(),
              Slider(
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  value: slider,
                  min: 0.0,
                  max: 100.0,
                  onChangeEnd: (v) {
                    setState(() {
                      slider = v;
                    });
                  },
                  onChanged: (v) {
                    setState(() {
                      slider = v;
                    });
                  }),
            ]).toContainer(color: Colors.black)
          ]).xContainer(color: Colors.white),
        ])
        .xSingleChildScroolView()
        .xCenter()
        .xScaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: <Widget>[
              align == TextAlign.left
                  ? FontAwesomeIcons.alignLeft
                      .xListTileIcon(
                          color: Colors.white,
                          onTap: () {
                            setState(() {
                              align = null;
                            });
                          })
                      .xap(value: 5)
                  : Icon(FontAwesomeIcons.alignLeft).xIconButton(onPressed: () {
                      setState(() {
                        align = TextAlign.left;
                      });
                    }),
              align == TextAlign.center
                  ? FontAwesomeIcons.alignCenter
                      .xListTileIcon(
                          color: Colors.white,
                          onTap: () {
                            setState(() {
                              align = null;
                            });
                          })
                      .xap(value: 5)
                  : Icon(FontAwesomeIcons.alignCenter).xIconButton(
                      onPressed: () {
                      setState(() {
                        align = TextAlign.center;
                      });
                    }),
              align == TextAlign.right
                  ? FontAwesomeIcons.alignRight
                      .xListTileIcon(
                          color: Colors.white,
                          onTap: () {
                            setState(() {
                              align = null;
                            });
                          })
                      .xap(value: 5)
                  : Icon(FontAwesomeIcons.alignRight).xIconButton(
                      onPressed: () {
                      setState(() {
                        align = TextAlign.right;
                      });
                    }),
            ],
          ),
          bottomNavigationBar: 'Add Text'
              .xTextColorWhite(
                fontWeight: FontWeight.bold,
                fontsize: 22,
              )
              .xFlatButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'name': name.text,
                    'color': currentColor,
                    'size': slider.toDouble(),
                    'align': align
                  });
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

  TextAlign align;
}

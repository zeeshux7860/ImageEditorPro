import 'package:firexcode/firexcode.dart';

import '../image_editor_pro.dart';
import 'colors_picker.dart';

class Sliders extends StatefulWidget {
  final int index;
  final Map mapValue;

  const Sliders({Key key, this.mapValue, this.index}) : super(key: key);

  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  @override
  void initState() {
    //  slider = widget.sizevalue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return xColumnCC.list(
      [
        10.0.sizedHeight(),
        'Size Adjust'.toUpperCase().xTextColorWhite().toCenter(),
        Divider(

            // height: 1,
            ),
        Slider(
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            value: widgetJson[widget.index]['size'],
            min: 0.0,
            max: 100.0,
            onChangeEnd: (v) {
              setState(() {
                widgetJson[widget.index]['size'] = v.toDouble();
              });
            },
            onChanged: (v) {
              setState(() {
                slider = v;
                // print(v.toDouble());
                widgetJson[widget.index]['size'] = v.toDouble();
              });
            }),
        10.0.sizedHeight(),
        xColumn.list([
          20.0.sizedHeight(),
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
                    widgetJson[widget.index]['color'] = Color(value);
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
                    widgetJson[widget.index]['color'] = Color(value);
                  });
                }).xExpanded(),
            'Reset'.text().xFlatButton(onPressed: () {})
          ]),
        ]).xContainer(color: Colors.white, rounded: 10),
        10.0.sizedHeight(),
        xRow.list([
          'Remove'
              .text()
              .xFlatButton(
                  color: Colors.white,
                  onPressed: () {
                    widgetJson.removeAt(widget.index);
                    back(context);
                    // setState(() {});
                  })
              .xExpanded()
        ]),
      ],
    ).xContainer(
      color: Colors.black87,
      height: 350,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(10), topLeft: Radius.circular(10)),
    );
  }
}

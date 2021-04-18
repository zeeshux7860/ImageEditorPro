import 'package:firexcode/firexcode.dart';

import 'colors_picker.dart';

class ColorPiskersSlider extends StatefulWidget {
  @override
  _ColorPiskersSliderState createState() => _ColorPiskersSliderState();
}

class _ColorPiskersSliderState extends State<ColorPiskersSlider> {
  @override
  Widget build(BuildContext context) {
    return xColumn.list(
      [
        'Slider Filter Color'.text().xap(value: 15),
        Divider(
          height: 1,
        ),
        20.0.sizedHeight(),
        'Slider Color'.text(),
        10.0.sizedHeight(),
        BarColorPicker(
            width: 300,
            thumbColor: Colors.white,
            cornerRadius: 10,
            pickMode: PickMode.Color,
            colorListener: (int value) {
              setState(() {
                //  currentColor = Color(value);
              });
            }),
        20.0.sizedHeight(),
        Text('Slider Opicity'),
        10.0.sizedHeight(),
        Slider(value: 0.1, min: 0.0, max: 1.0, onChanged: (v) {})
      ],
    ).xContainer(
      padding: EdgeInsets.all(20),
      height: 260,
      color: Colors.white,
    );
  }
}

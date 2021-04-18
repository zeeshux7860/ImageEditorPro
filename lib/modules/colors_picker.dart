import 'dart:math';
import 'package:firexcode/firexcode.dart';

enum PickMode {
  Color,
  Grey,
}

/// A listener which receives an color in int representation. as used
/// by [BarColorPicker.colorListener] and [CircleColorPicker.colorListener].
typedef ColorListener = void Function(int value);

/// Constant color of thumb shadow
const _kThumbShadowColor = Color(0x44000000);

/// A padding used to calculate bar height(thumbRadius * 2 - kBarPadding).
const _kBarPadding = 4;

/// Base64 encoded image for alpha picker background
//const _kAlphaTexture = "iVBORw0KGgoAAAANSUhEUgAAAAwAAAAMCAIAAADZF8uwAAAAGUlEQVQYV2M4gwH+YwCGIasIUwhT25BVBADtzYNYrHvv4gAAAABJRU5ErkJggg==";

/// A bar color picker
class BarColorPicker extends StatefulWidget {
  /// mode enum of pick a normal color or pick a grey color
  final PickMode pickMode;

  /// width of bar, if this widget is horizontal, than
  /// bar width is this value, if this widget is vertical
  /// bar height is this value
  final double width;

  /// A listener receives color pick events.
  final ColorListener colorListener;

  /// corner radius of the picker bar, for each corners
  final double cornerRadius;

  /// specifies the bar orientation
  final bool horizontal;

  /// thumb fill color
  final Color thumbColor;

  /// radius of thumb
  final double thumbRadius;

  /// initial color of this color picker.
  final Color initialColor;

  BarColorPicker({
    Key key,
    this.pickMode = PickMode.Color,
    this.horizontal = true,
    this.width = 200,
    this.cornerRadius = 0.0,
    this.thumbRadius = 8,
    this.initialColor = const Color(0xffff0000),
    this.thumbColor = Colors.black,
    @required this.colorListener,
  })  : assert(pickMode != null),
        assert(horizontal != null),
        assert(width != null),
        assert(cornerRadius != null),
        assert(colorListener != null),
        assert(initialColor != null),
        super(key: key);

  @override
  _BarColorPickerState createState() => _BarColorPickerState();
}

class _BarColorPickerState extends State<BarColorPicker> {
  double percent = 0.0;
  List<Color> colors;
  double barWidth, barHeight;

  @override
  void initState() {
    super.initState();
    if (widget.horizontal) {
      barWidth = widget.width;
      barHeight = widget.thumbRadius * 2 - _kBarPadding;
    } else {
      barWidth = widget.thumbRadius * 2 - _kBarPadding;
      barHeight = widget.width;
    }
    switch (widget.pickMode) {
      case PickMode.Color:
        colors = const [
          Color(0xffff0000),
          Color(0xffffff00),
          Color(0xff00ff00),
          Color(0xff00ffff),
          Color(0xff0000ff),
          Color(0xffff00ff),
          Color(0xffff0000)
        ];
        break;
      case PickMode.Grey:
        colors = const [Color(0xff000000), Color(0xffffffff)];
        break;
    }
    percent = HSVColor.fromColor(widget.initialColor).hue / 360;
  }

  @override
  Widget build(BuildContext context) {
    final thumbRadius = widget.thumbRadius;
    final horizontal = widget.horizontal;

    double thumbLeft, thumbTop;
    if (horizontal) {
      thumbLeft = barWidth * percent;
    } else {
      thumbTop = barHeight * percent;
    }
    // build thumb
    var thumb = XContainer(
      padding: EdgeInsets.zero,
      width: thumbRadius * 2,
      height: thumbRadius * 2,
      shadowColor: _kThumbShadowColor,
      spreadRadius: 2,
      blurRadius: 3,
      color: widget.thumbColor,
      rounded: thumbRadius,
    ).xPositioned(
      left: thumbLeft,
      top: thumbTop,
    );

    // build frame
    double frameWidth, frameHeight;
    if (horizontal) {
      frameWidth = barWidth + thumbRadius * 2;
      frameHeight = thumbRadius * 2;
    } else {
      frameWidth = thumbRadius * 2;
      frameHeight = barHeight + thumbRadius * 2;
    }
    Widget frame = SizedBox(width: frameWidth, height: frameHeight);

    // build content
    Gradient gradient;
    double left, top;
    if (horizontal) {
      gradient = LinearGradient(colors: colors);
      left = thumbRadius;
      top = (thumbRadius * 2 - barHeight) / 2;
    } else {
      gradient = LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter);
      left = (thumbRadius * 2 - barWidth) / 2;
      top = thumbRadius;
    }
    var content = XContainerGradient(
      padding: EdgeInsets.zero,
      width: barWidth,
      height: barHeight,
      rounded: widget.cornerRadius,
      gradient: gradient,
      child: ''.text(),
    ).xPositioned(
      left: left,
      top: top,
    );

    return xStack.list([frame, content, thumb]).xGesture(
      onPanDown: (details) => handleTouch(details.globalPosition, context),
      onPanStart: (details) => handleTouch(details.globalPosition, context),
      onPanUpdate: (details) => handleTouch(details.globalPosition, context),
    );
  }

  /// calculate colors picked from palette and update our states.
  void handleTouch(Offset globalPosition, BuildContext context) {
    RenderBox box = context.findRenderObject();
    var localPosition = box.globalToLocal(globalPosition);
    double percent;
    if (widget.horizontal) {
      percent = (localPosition.dx - widget.thumbRadius) / barWidth;
    } else {
      percent = (localPosition.dy - widget.thumbRadius) / barHeight;
    }
    percent = min(max(0.0, percent), 1.0);
    setState(() {
      this.percent = percent;
    });
    switch (widget.pickMode) {
      case PickMode.Color:
        var color = HSVColor.fromAHSV(1.0, percent * 360, 1.0, 1.0).toColor();
        widget.colorListener(color.value);
        break;
      case PickMode.Grey:
        final channel = (0xff * percent).toInt();
        widget.colorListener(
            Color.fromARGB(0xff, channel, channel, channel).value);
        break;
    }
  }
}

/// A circle palette color picker.
class CircleColorPicker extends StatefulWidget {
  // radius of the color palette, note that radius * 2 is not the final
  // width of this widget, instead is (radius + thumbRadius) * 2.
  final double radius;

  /// thumb fill color.
  final Color thumbColor;

  /// radius of thumb.
  final double thumbRadius;

  /// A listener receives color pick events.
  final ColorListener colorListener;

  /// initial color of this color picker.
  final Color initialColor;

  CircleColorPicker(
      {Key key,
      this.radius = 120,
      this.initialColor = const Color(0xffff0000),
      this.thumbColor = Colors.black,
      this.thumbRadius = 8,
      @required this.colorListener})
      : assert(radius != null),
        assert(thumbColor != null),
        assert(colorListener != null),
        super(key: key);

  @override
  State<CircleColorPicker> createState() {
    return _CircleColorPickerState();
  }
}

class _CircleColorPickerState extends State<CircleColorPicker> {
  static const List<Color> colors = [
    Color(0xffff0000),
    Color(0xffffff00),
    Color(0xff00ff00),
    Color(0xff00ffff),
    Color(0xff0000ff),
    Color(0xffff00ff),
    Color(0xffff0000)
  ];

  double thumbDistanceToCenter;
  double thumbRadians;

  @override
  void initState() {
    super.initState();
    thumbDistanceToCenter = widget.radius;
    final hue = HSVColor.fromColor(widget.initialColor).hue;
    thumbRadians = degreesToRadians(270 - hue);
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.radius;
    final thumbRadius = widget.thumbRadius;

    // compute thumb center coordinate
    final thumbCenterX = radius + thumbDistanceToCenter * sin(thumbRadians);
    final thumbCenterY = radius + thumbDistanceToCenter * cos(thumbRadians);

    // build thumb widget
    Widget thumb = Positioned(
        child: XContainer(
      padding: EdgeInsets.zero,
      width: thumbRadius * 2,
      height: thumbRadius * 2,
      shadowColor: _kThumbShadowColor,
      spreadRadius: 2,
      blurRadius: 3,
      color: widget.thumbColor,
      rounded: thumbRadius,
    ).xPositioned(
      left: thumbCenterX,
      top: thumbCenterY,
    ));
    return xStack.list(
      [
        SizedBox(
            width: (radius + thumbRadius) * 2,
            height: (radius + thumbRadius) * 2),
        Positioned(
          left: thumbRadius,
          top: thumbRadius,
          child: ''.text().xContainerGradient(
                padding: EdgeInsets.zero,
                width: radius * 2,
                height: radius * 2,
                rounded: radius,
                gradient: SweepGradient(colors: colors),
              ),
        ),
        thumb
      ],
    ).xGesture(
      behavior: HitTestBehavior.opaque,
      onPanDown: (details) => handleTouch(details.globalPosition, context),
      onPanStart: (details) => handleTouch(details.globalPosition, context),
      onPanUpdate: (details) => handleTouch(details.globalPosition, context),
    );
  }

  /// calculate colors picked from palette and update our states.
  void handleTouch(Offset globalPosition, BuildContext context) {
    RenderBox box = context.findRenderObject();
    var localPosition = box.globalToLocal(globalPosition);
    final centerX = box.size.width / 2;
    final centerY = box.size.height / 2;
    final deltaX = localPosition.dx - centerX;
    final deltaY = localPosition.dy - centerY;
    final distanceToCenter = sqrt(deltaX * deltaX + deltaY * deltaY);
    var theta = atan2(deltaX, deltaY);
    var degree = 270 - radiansToDegrees(theta);
    if (degree < 0) degree = 360 + degree;
    widget.colorListener(HSVColor.fromAHSV(1, degree, 1, 1).toColor().value);
    setState(() {
      thumbDistanceToCenter = min(distanceToCenter, widget.radius);
      thumbRadians = theta;
    });
  }

  /// convert an angle value from radian to degree representation.
  double radiansToDegrees(double radians) {
    return (radians + pi) / pi * 180;
  }

  /// convert an angle value from degree to radian representation.
  double degreesToRadians(double degrees) {
    return degrees / 180 * pi - pi;
  }
}

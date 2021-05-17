import 'package:firexcode/firexcode.dart';
import 'package:image_editor_pro/data/data.dart';

class Emojies extends StatefulWidget {
  @override
  _EmojiesState createState() => _EmojiesState();
}

class _EmojiesState extends State<Emojies> {
  List emojes = <dynamic>[];

  @override
  Widget build(BuildContext context) {
    return xColumn.list([
      xRowCC.list(['Select Emoji'.text()]).xap(value: 20),
      Divider(
        height: 1,
      ),
      10.0.sizedHeight(),
      GridView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 0.0, maxCrossAxisExtent: 60.0),
              children: emojis.map((String emoji) {
                return GridTile(
                    child: emoji
                        .xText(fontsize: 35)
                        .xContainer(padding: EdgeInsets.zero)
                        .xGesture(onTap: () {
                  Navigator.pop(context, {
                    'name': emoji,
                    'color': Colors.white,
                    'size': 12.0,
                    'align': TextAlign.center
                  });
                }));
              }).toList())
          .xContainer(
        height: 315,
        padding: EdgeInsets.all(0.0),
      )
    ]).xContainer(
      padding: EdgeInsets.all(0.0),
      height: 400,
      color: Colors.white,
      blurRadius: 10.9,
      shadowColor: Colors.grey[400],
    );
  }

  List<String> emojis = [];
  @override
  void initState() {
    super.initState();
    emojis = getSmileys();
  }
}

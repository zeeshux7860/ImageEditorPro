import 'dart:io';
import 'package:image_editor_pro/image_editor_pro.dart';
import 'package:firexcode/firexcode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage().xMaterialApp();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;

  Future<void> getimageditor() =>
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ImageEditorPro(
          appBarColor: Colors.black87,
          bottomBarColor: Colors.black87,
          pathSave: null,
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

  @override
  Widget build(BuildContext context) {
    return condition(
            condtion: _image == null,
            isTrue: 'Open Editor'.text().xRaisedButton(
              onPressed: () {
                getimageditor();
              },
            ).toCenter(),
            isFalse:
                _image == null ? Container() : Image.file(_image).toCenter())
        .xScaffold(
            appBar: 'Image Editor Pro example'.xTextColorWhite().xAppBar(),
            floatingActionButton:
                Icons.add.xIcons().xFloationActiobButton(color: Colors.red));
  }
}

Widget condition({bool condtion, Widget isTrue, Widget isFalse}) {
  return condtion ? isTrue : isFalse;
}

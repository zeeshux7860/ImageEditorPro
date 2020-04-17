import 'package:flutter/material.dart';

class BottomBarContainer extends StatelessWidget {
  final Color colors;
  final Function ontap;
  final String title;
  final IconData icons;

  const BottomBarContainer(
      {Key key, this.ontap, this.title, this.icons, this.colors})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width / 5,
      color: colors,
      child: Material(
        color: Colors.black87,
        child: InkWell(
          onTap: ontap,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(
                icons,
                color: Colors.white,
              ),
              new SizedBox(
                height: 4,
              ),
              new Text(
                title,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

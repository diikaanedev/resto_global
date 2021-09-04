import 'package:flutter/material.dart';
import 'package:resto_dashbord/utils/colors-by-dii.dart';

class CardListCmdArchiveItem extends StatefulWidget {
  final String date;

  const CardListCmdArchiveItem({Key key, this.date}) : super(key: key);
  @override
  _CardListCmdArchiveItemState createState() => _CardListCmdArchiveItemState();
}

class _CardListCmdArchiveItemState extends State<CardListCmdArchiveItem> {
  Size size;
  bool active = false;
  bool chargement = false;
  bool isValid = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width * .25,
          height: size.height * .4,
        ),
        Positioned(
          top: size.height * .028,
          child: Container(
            height: size.height * .15,
            width: size.width * .25,
            // color: NOIR,
            child: Center(
              child: Container(
                height: size.height * .15,
                width: size.width * .25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('assets/images/icon_archive.png')),
                  // color: Color.fromRGBO(249, 249, 249, 1)
                ),
                // color: GRIS,
              ),
            ),
          ),
        ),
        Positioned(
            top: size.height * .2,
            child: Container(
              height: size.height * .07,
              width: size.width * .25,
              // color: VERT,
              child: Center(
                child: Text(
                  widget.date,
                  style: TextStyle(
                      fontSize: 18, color: BLUE, fontWeight: FontWeight.w900),
                ),
              ),
            ))
      ],
    );
  }
}

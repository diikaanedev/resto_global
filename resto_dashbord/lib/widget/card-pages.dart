import 'package:flutter/material.dart';
import 'package:resto_dashbord/utils/colors-by-dii.dart';
import 'package:resto_dashbord/widget/card-list-cmd-archive.dart';
import 'package:resto_dashbord/widget/card-list-cmd-en-cour.dart';
import 'package:resto_dashbord/widget/card-list-cmd.dart';

class CardPageBody extends StatefulWidget {
  final int choix;

  const CardPageBody({Key key, this.choix}) : super(key: key);
  @override
  _CardPageBodyState createState() => _CardPageBodyState();
}

class _CardPageBodyState extends State<CardPageBody> {
  @override
  Widget build(BuildContext context) {
    if (widget.choix == 1) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: VERT,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: getListCmd(),
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(8),
        ),
      );
    } else if (widget.choix == 2) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: getListCmdEnCour(),
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(8),
        ),
      );
    } else if (widget.choix == 3) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: getListCmdArchive(),
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(8),
        ),
      );
    }
  }
}

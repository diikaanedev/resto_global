import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/utils/colors-by-dii.dart';
import 'package:resto_client/widget/menu-card-item.dart';

class MenuCardRow extends StatefulWidget {
  @override
  _MenuCardRowState createState() => _MenuCardRowState();
}

class _MenuCardRowState extends State<MenuCardRow> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: GRIS_LEGER, width: .5))),
          child: Row(
            children: [
              Spacer(),
              Container(
                width: constraints.maxWidth * .25,
                child: MenuCardItem(menuModel: appState.listeMenu[0]),
              ),
              Spacer(),
              Container(
                width: constraints.maxWidth * .25,
                child: MenuCardItem(menuModel: appState.listeMenu[1]),
              ),
              Spacer(),
              Container(
                width: constraints.maxWidth * .25,
                child: MenuCardItem(menuModel: appState.listeMenu[2]),
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}

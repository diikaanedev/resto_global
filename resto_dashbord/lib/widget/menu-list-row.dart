import 'package:flutter/material.dart';
import 'package:resto_dashbord/main.dart';
import 'package:resto_dashbord/widget/menu-list-row-item.dart';

List<Widget> getListeMenu({double longeur, double largeur}) {
  List<Widget> liste = [];
  liste.add(Spacer());
  for (var item in appState.listeMenu) {
    liste.add(
      Container(
        width: longeur,
        height: largeur,
        child: MenuListRowItem(
          menuModel: item,
        ),
      ),
    );
    liste.add(Spacer());
  }
  liste.add(Spacer());

  return liste;
}

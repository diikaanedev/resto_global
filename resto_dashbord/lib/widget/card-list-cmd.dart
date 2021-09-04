import 'package:flutter/material.dart';
import 'package:resto_dashbord/main.dart';
import 'package:resto_dashbord/widget/card-list-cmd-item.dart';

List<Widget> getListCmd() {
  List<Widget> liste = [];
  for (var item in appState.listeCmd) {
    liste.add(CardListCmdItem(
      commande: item,
    ));
    liste.add(SizedBox(
      width: 12,
    ));
  }
  return liste;
}

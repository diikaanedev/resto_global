import 'package:flutter/material.dart';
import 'package:resto_dashbord/main.dart';
import 'package:resto_dashbord/widget/card-list-cmd-en-cour-item.dart';

List<Widget> getListCmdEnCour() {
  List<Widget> liste = [];
  for (var item in appState.listeCmdEnCour) {
    liste.add(CardListCmdEnCourItem(
      commande: item,
    ));
    liste.add(SizedBox(
      width: 12,
    ));
  }
  return liste;
}

import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/widget/card-list-cmd-item.dart';

List<Widget> getListeCmd() {
  List<Widget> liste = [];
  for (var item in appState.listeCmd) {
    liste.add(CardListCmdItem(
      platModel: item,
    ));
  }
  liste.add(SizedBox(
    height: 30,
  ));
  return liste;
}

import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/widget/card-palt-item-view.dart';

List<Widget> getListePlat({int choix}) {
  List<Widget> liste = [];
  if (choix == 1) {
    for (var item in appState.listePlatEntre) {
      liste.add(CardPlatItemView(
        platModel: item,
      ));
    }
  } else if (choix == 2) {
    for (var item in appState.listePlatResistances) {
      liste.add(CardPlatItemView(
        platModel: item,
      ));
    }
  } else if (choix == 3) {}

  return liste;
}

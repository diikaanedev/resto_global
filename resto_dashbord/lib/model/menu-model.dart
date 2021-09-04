import 'package:flutter/foundation.dart';

class MenuModel {
  String name;
  String urlTofActif;
  String urlTofInactif;
  bool isActive;
  int choix;

  MenuModel({
    @required this.name,
    @required this.urlTofActif,
    @required this.urlTofInactif,
    @required this.isActive,
    @required this.choix,
  });
}

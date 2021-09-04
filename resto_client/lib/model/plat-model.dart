import 'package:flutter/foundation.dart';

class PlatModel {
  int quantite;
  String name;
  int price;
  String description;
  String urlTof;
  bool isAdd;
  PlatModel(
      {this.description = '',
      this.isAdd = false,
      @required this.name,
      @required this.price,
      this.quantite = 1,
      @required this.urlTof});
}

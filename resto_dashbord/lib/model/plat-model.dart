import 'package:flutter/foundation.dart';

class PlatModel {
  int quantite;
  String name;
  int price;
  PlatModel({
    @required this.name,
    @required this.quantite,
    @required this.price,
  });

  static fromString(String str) {
    print(str);
    List<PlatModel> liste = [];
    var data = str.split('|');
    for (var i = 0; i < data.length - 1; i++) {
      var item = data[i];
      var details = item.split('#');
      liste.add(PlatModel(
          name: details[0], quantite: int.parse(details[1]), price: 0));
    }
    return liste;
  }
}

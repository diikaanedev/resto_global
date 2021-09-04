import 'package:flutter/foundation.dart';
import 'package:resto_dashbord/model/plat-model.dart';

class Commande {
  int id;
  String table;
  int price;
  String heureCmd;
  List<PlatModel> listePLat;
  Commande(
      {@required this.table,
      @required this.heureCmd,
      @required this.listePLat,
      @required this.id,
      @required this.price});

  static fromJson(Map<dynamic, dynamic> l) {
    List<Commande> liste = [];

    for (var item in l['data']) {
      DateTime dateTimeCreatedAt = DateTime.parse(item['createdAt']);
      // final birthday = DateTime.now(int.parse(y),int.parse(m),int.parse(d),);
      final date2 = DateTime.now();
      final difference = date2.difference(dateTimeCreatedAt).inMinutes;
      print(difference);
      liste.add(Commande(
          table: item['tableCommande'],
          id: item['id'],
          heureCmd: difference.toString(),
          listePLat: PlatModel.fromString(item['listPlatCommande']),
          price: int.parse(item['prixCommande'])));
    }
    return liste;
  }
}

import 'package:flutter/foundation.dart';

class NotificationModel {
  int id;
  String table;
  bool typeNotif;

  NotificationModel(
      {@required this.id, @required this.table, @required this.typeNotif});

  static fromJson(Map<dynamic, dynamic> l) {
    List<NotificationModel> liste = [];

    for (var item in l['data']) {
      liste.add(NotificationModel(
        typeNotif: item['statusNotif'] == '0',
        table: item['tableNotif'],
        id: item['id'],
      ));
    }
    return liste.reversed.toList();
  }
}

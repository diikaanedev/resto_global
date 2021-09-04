import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:resto_dashbord/widget/card-list-cmd-archive-item.dart';

List<Widget> getListCmdArchive() {
  initializeDateFormatting('fr_FR', null).then((_) => {});

  var date = new DateTime.now().subtract(Duration(days: 2));

  List<Widget> liste = [];
  liste.add(CardListCmdArchiveItem(
    date: 'Audjourd\'hui',
  ));

  liste.add(CardListCmdArchiveItem(
    date: 'Hier',
  ));

  liste.add(CardListCmdArchiveItem(
    date: DateFormat.yMMMMEEEEd('fr_FR').format(date),
  ));

  liste.add(CardListCmdArchiveItem(
    date: 'Voir +',
  ));
  liste.add(SizedBox(
    width: 12,
  ));
  return liste;
}
//  DateTime(date.year, date.month - 1, date.day)
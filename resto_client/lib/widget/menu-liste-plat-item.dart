import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/model/list-plat.dart';
import 'package:resto_client/model/plat-model.dart';
import 'package:resto_client/utils/colors-by-dii.dart';

class MenuListePlatItem extends StatefulWidget {
  final PlatModel platModel;

  const MenuListePlatItem({Key key, this.platModel}) : super(key: key);
  @override
  _MenuListePlatItemState createState() => _MenuListePlatItemState();
}

class _MenuListePlatItemState extends State<MenuListePlatItem> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * .07,
            width: MediaQuery.of(context).size.width * .5,
            // color: VERT,
            child: GestureDetector(
              onTap: () {
                if (appState.listeMenu
                        .where((element) => element.isActive)
                        .first
                        .choix ==
                    1) {
                  appState.setState(() {
                    appState.listePlatEntre = [];
                    appState.listePlatEntre.add(widget.platModel);
                    for (var item in listeEntreesData
                        .where(
                            (element) => element.name != widget.platModel.name)
                        .toList()) {
                      appState.listePlatEntre.add(item);
                    }
                    appState.isShowListPlat = false;
                  });
                } else if (appState.listeMenu
                        .where((element) => element.isActive)
                        .first
                        .choix ==
                    2) {
                } else if (appState.listeMenu
                        .where((element) => element.isActive)
                        .first
                        .choix ==
                    3) {}
              },
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  Text(
                    widget.platModel.name,
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

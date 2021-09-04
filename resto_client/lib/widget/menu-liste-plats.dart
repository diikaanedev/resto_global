import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/utils/colors-by-dii.dart';
import 'package:resto_client/widget/menu-liste-plat-item.dart';

class MenuListePlats extends StatefulWidget {
  @override
  _MenuListePlatsState createState() => _MenuListePlatsState();
}

class _MenuListePlatsState extends State<MenuListePlats> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        String name =
            appState.listeMenu.where((element) => element.isActive).first.name;
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Column(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  appState.setState(() {
                    appState.isShowListPlat = false;
                  });
                },
                child: Container(
                  height: constraints.maxHeight * .12,
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * .05,
                      ),
                      Container(
                        // width: constraints.maxWidth * .4,
                        child: Center(
                          child: Text(
                            ' Liste ${name.toLowerCase()} ',
                            style: TextStyle(
                                fontFamily: 'Satisfy',
                                fontSize: 36,
                                color: ROUGE,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * .03,
                      ),
                      Icon(
                        Icons.arrow_drop_up,
                        color: ROUGE,
                        size: 50,
                      )
                    ],
                  ),
                  // color: ROUGE,
                ),
              ),
              Spacer(),
              Container(
                height: constraints.maxHeight * .8,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(8.0),
                  children: getListe(
                      choix: appState.listeMenu
                          .where((element) => element.isActive)
                          .first
                          .choix),
                ),
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }

  List<Widget> getListe({int choix}) {
    List<Widget> liste = [];
    if (choix == 1) {
      for (var item in appState.listePlatEntre) {
        liste.add(MenuListePlatItem(
          platModel: item,
        ));
      }
    } else if (choix == 2) {
    } else if (choix == 3) {}
    return liste;
  }
}

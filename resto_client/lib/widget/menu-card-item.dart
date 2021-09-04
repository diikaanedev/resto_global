import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/model/menu-model.dart';
import 'package:resto_client/utils/colors-by-dii.dart';

class MenuCardItem extends StatefulWidget {
  final MenuModel menuModel;

  const MenuCardItem({Key key, this.menuModel}) : super(key: key);
  @override
  _MenuCardItemState createState() => _MenuCardItemState();
}

class _MenuCardItemState extends State<MenuCardItem> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () {
            for (var item in appState.listeMenu) {
              appState.setState(() {
                item.isActive = false;
              });
            }
            appState.setState(() {
              appState.listeMenu
                      .where((element) => element.choix == widget.menuModel.choix)
                      .toList()
                      .first
                      .isActive =
                  !appState.listeMenu
                      .where(
                          (element) => element.choix == widget.menuModel.choix)
                      .toList()
                      .first
                      .isActive;
            });
          },
          child: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              children: [
                Spacer(),
                Spacer(),
                Spacer(),
                Container(
                  height: constraints.maxHeight * .7,
                  width: constraints.maxWidth * .7,
                  decoration: BoxDecoration(
                    color:
                        widget.menuModel.isActive ? ROUGE : Colors.transparent,
                    border: !widget.menuModel.isActive
                        ? Border.all(color: GRIS_FORT, width: 1)
                        : Border.all(color: ROUGE, width: 0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // color: VERT,
                  child: Center(
                    child: Container(
                      height: constraints.maxHeight * .6,
                      width: constraints.maxWidth * .6,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.menuModel.isActive
                                  ? widget.menuModel.urlTofActif
                                  : widget.menuModel.urlTofInactif))),
                    ),
                  ),
                ),
                Spacer(),
                Spacer(),
                Text(
                  '${widget.menuModel.name}'.toUpperCase(),
                  style: TextStyle(
                      color: widget.menuModel.isActive ? ROUGE : GRIS_FORT,
                      fontWeight: widget.menuModel.isActive
                          ? FontWeight.bold
                          : FontWeight.w500),
                ),
                Spacer(),
                Spacer(),
                widget.menuModel.isActive
                    ? Container(
                        height: constraints.maxHeight * .02,
                        width: constraints.maxWidth * .9,
                        color: ROUGE,
                      )
                    : Container(),
                // Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

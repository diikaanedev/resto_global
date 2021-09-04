import 'package:flutter/material.dart';
import 'package:resto_dashbord/main.dart';
import 'package:resto_dashbord/model/menu-model.dart';
import 'package:resto_dashbord/utils/colors-by-dii.dart';

class MenuListRowItem extends StatefulWidget {
  final MenuModel menuModel;

  const MenuListRowItem({Key key, this.menuModel}) : super(key: key);
  @override
  _MenuListRowItemState createState() => _MenuListRowItemState();
}

class _MenuListRowItemState extends State<MenuListRowItem> {
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
                  width: constraints.maxWidth * .6,
                  decoration: BoxDecoration(
                    color:
                        widget.menuModel.isActive ? BLANC : Colors.transparent,
                    border: !widget.menuModel.isActive
                        ? Border.all(color: GRIS, width: 1)
                        : Border(
                            bottom: BorderSide.none,
                            top: BorderSide.none,
                            left: BorderSide.none,
                            right: BorderSide.none,
                          ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // color: VERT,
                  child: Center(
                    child: Container(
                      height: constraints.maxHeight * .5,
                      width: constraints.maxWidth * .5,
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
                      color: widget.menuModel.isActive ? LINEAR1 : GRIS,
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
                        color: LINEAR1,
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

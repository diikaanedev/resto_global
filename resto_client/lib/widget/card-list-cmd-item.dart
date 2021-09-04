import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/model/plat-model.dart';
import 'package:resto_client/utils/colors-by-dii.dart';
import 'package:resto_client/utils/price-by-dii.dart';

class CardListCmdItem extends StatefulWidget {
  final PlatModel platModel;

  const CardListCmdItem({Key key, this.platModel}) : super(key: key);
  @override
  _CardListCmdItemState createState() => _CardListCmdItemState();
}

class _CardListCmdItemState extends State<CardListCmdItem> {
  bool isDeletable = true;
  double taille = 30;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          height: MediaQuery.of(context).size.height * .05,
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              GestureDetector(
                onTap: () {
                  appState.setState(() {
                    appState.platModelSelect = widget.platModel;
                    appState.isShowDialogAchat = true;
                  });
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: BLANC,
                    ),
                    child: Center(
                      child: Text(
                        '${widget.platModel.quantite}',
                        style: TextStyle(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            fontWeight: FontWeight.w900,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .65,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: GRIS_LEGER, width: .5))),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      elevation: 0,
                      // color: ROUGE,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .45,
                        child: Text(
                          widget.platModel.name,
                          style: TextStyle(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Material(
                      // color: ROUGE,
                      child: Text(
                        '${PRICE_FORMAT.format(appState.convertToDevise(price: (widget.platModel.price * widget.platModel.quantite)))}',
                        style: TextStyle(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  if (appState.listeMenu
                          .where((element) => element.isActive)
                          .first
                          .choix ==
                      1) {
                    if (appState.listePlatEntre
                            .where((element) =>
                                element.name.toLowerCase() ==
                                    widget.platModel.name.toLowerCase() &&
                                element.isAdd == true)
                            .length ==
                        1) {
                      appState.setState(() {
                        appState.listeCmd.remove(widget.platModel);
                      });
                      appState.setState(() {
                        appState.listePlatEntre
                            .where((element) =>
                                element.name.toLowerCase() ==
                                widget.platModel.name.toLowerCase())
                            .first
                            .isAdd = false;
                      });
                    }
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
                child: Center(
                    child: Icon(
                  Icons.delete,
                  color: ROUGE,
                  size: 30,
                )),
              ),
            ],
          ),
        ),
      );
    });
  }
}

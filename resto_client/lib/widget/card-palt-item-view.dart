import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/model/plat-model.dart';
import 'package:resto_client/utils/colors-by-dii.dart';
import 'package:resto_client/utils/price-by-dii.dart';

class CardPlatItemView extends StatefulWidget {
  final PlatModel platModel;

  const CardPlatItemView({Key key, this.platModel}) : super(key: key);
  @override
  _CardPlatItemViewState createState() => _CardPlatItemViewState();
}

class _CardPlatItemViewState extends State<CardPlatItemView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width * .95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: BLANC,
            ),
            child: Stack(
              children: [
                Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // color: ROUGE,
                  ),
                ),
                Positioned(
                    child: Container(
                  height: constraints.maxHeight * .6,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                      // color: VERT,
                      image: DecorationImage(
                          image: AssetImage(widget.platModel.urlTof),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      )),
                )),
                Positioned(
                    top: constraints.maxHeight * .61,
                    child: Container(
                      height: constraints.maxHeight * .4,
                      width: constraints.maxWidth,
                      // color: ROUGE,
                      child: Column(
                        children: [
                          // Spacer(),
                          GestureDetector(
                            onTap: () {
                              appState.setState(() {
                                appState.isShowListPlat = true;
                              });
                            },
                            child: Container(
                              // height: constraints.maxHeight * .17,
                              child: Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    widget.platModel.name,
                                    style: TextStyle(
                                        color: ROUGE,
                                        // fontFamily: 'Satisfy',
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * .05,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 50,
                                    color: ROUGE,
                                  ),
                                  Spacer(),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          // Spacer(),
                          Container(
                            height: constraints.maxHeight * .18,
                            child: Row(
                              children: [
                                Spacer(),
                                Container(
                                  width: constraints.maxWidth * .07,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Icon ionic-md-pricetag.png'))),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * .02,
                                ),
                                Text(
                                  ' ${PRICE_FORMAT.format(appState.convertToDevise(price: widget.platModel.price))}',
                                  style: TextStyle(
                                      color: NOIR,
                                      fontSize: 38,
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                Container(
                                  width: constraints.maxWidth * .4,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (appState.listeMenu
                                              .where(
                                                  (element) => element.isActive)
                                              .first
                                              .choix ==
                                          1) {
                                        if (appState.listePlatEntre
                                                .where((element) =>
                                                    element.name
                                                            .toLowerCase() ==
                                                        widget.platModel.name
                                                            .toLowerCase() &&
                                                    element.isAdd != false)
                                                .length ==
                                            0) {
                                          appState.setState(() {
                                            appState.listePlatEntre
                                                .where((element) =>
                                                    element.name
                                                        .toLowerCase() ==
                                                    widget.platModel.name
                                                        .toLowerCase())
                                                .first
                                                .isAdd = true;

                                            appState.listeCmd.add(appState
                                                .listePlatEntre
                                                .where((element) =>
                                                    element.name
                                                        .toLowerCase() ==
                                                    widget.platModel.name
                                                        .toLowerCase())
                                                .first);
                                            appState.isShowDialogAchat = true;
                                          });
                                        }
                                      } else if (appState.listeMenu
                                              .where(
                                                  (element) => element.isActive)
                                              .first
                                              .choix ==
                                          2) {
                                        if (appState.listePlatResistances
                                                .where((element) =>
                                                    element.name
                                                            .toLowerCase() ==
                                                        widget.platModel.name
                                                            .toLowerCase() &&
                                                    element.isAdd != false)
                                                .length ==
                                            0) {
                                          appState.setState(() {
                                            appState.listePlatResistances
                                                .where((element) =>
                                                    element.name
                                                        .toLowerCase() ==
                                                    widget.platModel.name
                                                        .toLowerCase())
                                                .first
                                                .isAdd = true;

                                            appState.listeCmd.add(appState
                                                .listePlatResistances
                                                .where((element) =>
                                                    element.name
                                                        .toLowerCase() ==
                                                    widget.platModel.name
                                                        .toLowerCase())
                                                .first);
                                            appState.isShowDialogAchat = true;
                                          });
                                        }
                                      } else if (appState.listeMenu
                                              .where(
                                                  (element) => element.isActive)
                                              .first
                                              .choix ==
                                          3) {}
                                    },
                                    child: Container(
                                      width: constraints.maxWidth * .35,
                                      height: constraints.maxHeight * .1,
                                      decoration: BoxDecoration(
                                          color: widget.platModel.isAdd
                                              ? BLANC
                                              : ROUGE,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: widget.platModel.isAdd
                                          ? Row(
                                              children: [
                                                Spacer(),
                                                Container(
                                                  width: constraints.maxWidth *
                                                      .15,
                                                  child: Center(
                                                    child: Text(
                                                      'Ajouté',
                                                      style: TextStyle(
                                                          color: NOIR,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.check,
                                                  color: VERT,
                                                  size: 30,
                                                ),
                                                Spacer(),
                                              ],
                                            )
                                          : Center(
                                              child: Text(
                                                'Ajouter à la table',
                                                style: TextStyle(
                                                    color: BLANC,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Spacer(),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}

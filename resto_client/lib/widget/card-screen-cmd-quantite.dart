import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/model/plat-model.dart';
import 'package:resto_client/utils/colors-by-dii.dart';

class CardScreenCmdQuantite extends StatefulWidget {
  @override
  _CardScreenCmdQuantiteState createState() => _CardScreenCmdQuantiteState();
}

class _CardScreenCmdQuantiteState extends State<CardScreenCmdQuantite> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // PlatModel platModel = appState.listeCmd.last;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              children: [
                Spacer(),
                Spacer(),
                Spacer(),
                Container(
                  height: constraints.maxHeight * .2,
                  // color: VERT,
                  child: Center(
                    child: Text(
                      'Combien ?',
                      style: TextStyle(
                          color: NOIR,
                          fontSize: 26,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: constraints.maxHeight * .3,
                  // color: VERT,
                  child: Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          if (appState.platModelSelect.name == '') {
                            if (appState.listeCmd.last.quantite <= 1) {
                              appState.setState(() {
                                appState.listeCmd.last.quantite = 1;
                              });
                            } else {
                              appState.setState(() {
                                appState.listeCmd.last.quantite--;
                              });
                            }
                          } else {
                            if (appState.listeCmd
                                    .where((element) =>
                                        element.name ==
                                        appState.platModelSelect.name)
                                    .first
                                    .quantite <=
                                1) {
                              appState.setState(() {
                                appState.listeCmd
                                    .where((element) =>
                                        element.name ==
                                        appState.platModelSelect.name)
                                    .first
                                    .quantite = 1;
                              });
                            } else {
                              appState.setState(() {
                                appState.listeCmd
                                    .where((element) =>
                                        element.name ==
                                        appState.platModelSelect.name)
                                    .first
                                    .quantite--;
                              });
                            }
                          }
                        },
                        child: Container(
                          width: constraints.minWidth * .15,
                          decoration: BoxDecoration(
                              // color: VERT,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Icon feather-minus-square.png'))),
                        ),
                      ),
                      SizedBox(
                        width: constraints.minWidth * .02,
                      ),
                      Container(
                        // width: constraints.minWidth * .15,
                        child: Center(
                          child: Text(
                            appState.platModelSelect.name != ''
                                ? '${appState.listeCmd.where((element) => element.name == appState.platModelSelect.name).first.quantite}'
                                : ' ${appState.listeCmd.last.quantite} ',
                            style: TextStyle(fontSize: 30, color: GRIS_LEGER),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: constraints.minWidth * .02,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (appState.platModelSelect.name == '') {
                            appState.setState(() {
                              appState.listeCmd.last.quantite++;
                            });
                          } else {
                            appState.setState(() {
                              appState.listeCmd
                                  .where((element) =>
                                      element.name ==
                                      appState.platModelSelect.name)
                                  .first
                                  .quantite++;
                            });
                          }
                        },
                        child: Container(
                          width: constraints.minWidth * .15,
                          decoration: BoxDecoration(
                              // color: VERT,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Icon feather-plus-square.png'))),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: constraints.maxHeight * .25,
                  // color: VERT,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        appState.setState(() {
                          appState.platModelSelect =
                              PlatModel(name: '', price: 0, urlTof: '');
                          appState.isShowDialogAchat = false;
                        });
                      },
                      child: Container(
                        height: constraints.maxHeight * .2,
                        width: constraints.maxWidth * .2,
                        child: Center(
                          child: Text(
                            'OK',
                            style: TextStyle(fontSize: 20, color: BLANC),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: VERT),
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

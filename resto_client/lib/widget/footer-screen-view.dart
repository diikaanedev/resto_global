import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/screen/home-screen.dart';
import 'package:resto_client/utils/colors-by-dii.dart';
import 'package:resto_client/utils/price-by-dii.dart';
import 'package:resto_client/utils/web-by-dii.dart';

class FooterScreenView extends StatefulWidget {
  @override
  _FooterScreenViewState createState() => _FooterScreenViewState();
}

class _FooterScreenViewState extends State<FooterScreenView> {
  int devis = 0;
  bool chargement = false;
  bool chargement_appel = false;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Column(
            children: [
              Spacer(),
              Spacer(),
              Container(
                height: constraints.maxHeight * .4,
                // color: ROUGE,
                child: Row(
                  children: [
                    SizedBox(
                      width: constraints.minWidth * .07,
                    ),
                    Container(
                      width: constraints.maxWidth * .3,
                      // color: VERT,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Icon payment-facture.png'))),
                    ),
                    SizedBox(
                      width: constraints.minWidth * .05,
                    ),
                    Text(
                      '${PRICE_FORMAT.format(appState.getPrice())}',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          color: ROUGE),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      // width: constraints.maxWidth * .15,
                      height: constraints.maxHeight * .25,
                      child: DropdownButton(
                        value: appState.devis,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        // iconSize: 30,
                        underline: Container(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 34,
                          color: NOIR,
                        ),
                        items: <DropdownMenuItem<int>>[
                          new DropdownMenuItem(
                            child: new Text('XOF'),
                            value: 0,
                          ),
                          new DropdownMenuItem(
                            child: new Text('EUR'),
                            value: 1,
                          ),
                          new DropdownMenuItem(
                            child: new Text('USD'),
                            value: 2,
                          ),
                          new DropdownMenuItem(
                            child: new Text('YEN'),
                            value: 3,
                          ),
                        ],
                        onChanged: (int value) {
                          appState.setState(() {
                            appState.devis = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Spacer(),
              Container(
                height: constraints.maxHeight * .4,
                // color: ROUGE,
                child: Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () async {
                        print(appState.getPrice());
                        if (appState.listeCmd.length > 0) {
                          setState(() {
                            chargement = true;
                          });
                          Random rnd;
                          int min = 1;
                          int max = 10;
                          rnd = new Random();

                          String descriptionCmd = '';
                          for (var item in appState.listeCmd) {
                            descriptionCmd += '${item.name}#${item.quantite}|';
                          }
                          print(descriptionCmd);
                          UtilsHttp.postByIssa({
                            'prix': '${appState.getPrice()}',
                            'table': '${min + rnd.nextInt(max - min)}',
                            'listePlat': '$descriptionCmd'
                          }, 'commande')
                              .then((response) {
                            var info = json.decode(response.body);

                            if (info['statusCode'] == 200) {
                              appState.setState(() {
                                chargement = false;

                                appState.isShowDialogValidCmd = true;
                              });
                            } else {
                              print('err => err');
                            }
                          });
                        }
                      },
                      child: Container(
                        width: constraints.maxWidth * .35,
                        child: Center(
                          child: chargement
                              ? CircularProgressIndicator(
                                  backgroundColor: ROUGE,
                                  valueColor:
                                      new AlwaysStoppedAnimation<Color>(VERT),
                                )
                              : Text(
                                  '  Valider  ',
                                  style: TextStyle(
                                      color: BLANC,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: ROUGE),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * .05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Random rnd;
                        int min = 1;
                        int max = 10;
                        rnd = new Random();
                        setState(() {
                          chargement_appel = true;
                        });
                        UtilsHttp.postByIssa(
                                {"table": "${min + rnd.nextInt(max - min)}"},
                                'notification')
                            .then((response) {
                          var info = json.decode(response.body);

                          if (info['statusCode'] == 200) {
                            setState(() {
                              chargement_appel = false;
                            });
                            appState.setState(() {
                              appState.setState(() {
                                appState.isShowDialogValidCallServer = true;
                              });
                            });
                          } else {
                            print('err => err');
                          }
                        });
                      },
                      child: Container(
                        width: constraints.maxWidth * .25,
                        child: Center(
                          child: chargement_appel
                              ? CircularProgressIndicator(
                                  backgroundColor: VERT,
                                  valueColor:
                                      new AlwaysStoppedAnimation<Color>(ROUGE),
                                )
                              : Container(
                                  width: constraints.maxWidth * .15,
                                  height: constraints.maxHeight * .3,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Icon feather-phone-call.png'))),
                                ),
                        ),
                        decoration: BoxDecoration(
                          color: VERT,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * .05,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Spacer(),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}

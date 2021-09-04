import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:resto_dashbord/main.dart';
import 'package:resto_dashbord/model/commande-model.dart';
import 'package:resto_dashbord/model/notification-model.dart';
import 'package:resto_dashbord/utils/colors-by-dii.dart';
import 'package:resto_dashbord/utils/web-by-dii.dart';
import 'package:resto_dashbord/widget/card-pages.dart';
import 'package:resto_dashbord/widget/menu-list-row.dart';
import 'package:resto_dashbord/widget/notifications.dart';
import 'package:resto_dashbord/widget/top-nav-profile.dart';

_HomeScreenState homeScreenState;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    homeScreenState = _HomeScreenState();
    return homeScreenState;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  bool chargement = true;
  bool chargementNotif = true;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (e) {
      print('here ');
      getCmd();
    });
    // print('here mon initState');
    // getCmd();
    super.initState();
  }

  getCmd() async {
    // print('here');
    UtilsHttp.getByIssa('commande').then((req) {
      print(req.statusCode);
      if (req.statusCode == 200) {
        var info = json.decode(req.body);
        print(info);
        appState.setState(() {
          appState.listeCmd = Commande.fromJson(info);
        });
        appState.setState(() {
          appState.commande = appState.listeCmd.length > 0
              ? appState.listeCmd.first
              : Commande(
                  table: '', heureCmd: '', listePLat: [], id: 0, price: 0);
        });
        setState(() {
          chargement = false;
        });
      }
    });
    UtilsHttp.getByIssa('notification').then((response) {
      if (response.statusCode == 200) {
        var info = json.decode(response.body);

        appState.setState(() {
          appState.listeNotif = NotificationModel.fromJson(info);
        });
        setState(() {
          chargementNotif = false;
        });
      }
    });
    UtilsHttp.getByIssa('commande/traitement').then((response) {
      if (response.statusCode == 200) {
        var info = json.decode(response.body);
        // print(info);
        appState.setState(() {
          appState.listeCmdEnCour = Commande.fromJson(info);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return SafeArea(
      bottom: false,
      top: false,
      left: false,
      right: false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: heigth,
                width: width,
                color: BLANC,
              ),
              Positioned(
                  top: heigth * .0435,
                  child: Container(
                    height: heigth * .1,
                    width: width,
                    color: LINEAR1.withOpacity(.15),
                    child: TopNavProfile(),
                  )),
              Positioned(
                  top: heigth * .17,
                  child: Container(
                      height: heigth * .15,
                      width: width,
                      // color: VERT,
                      child: Row(
                        children: [
                          Container(
                            height: heigth * .15,
                            width: width * .8,
                            child: Row(
                              children: getListeMenu(
                                  longeur: heigth * .2, largeur: width * .6),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: width * .18,
                            // color: VERT,
                            child: Center(
                              child: Container(
                                height: heigth * .25,
                                width: width * .18,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/image.png'),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: width * .05,
                          // )
                        ],
                      ))),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: heigth * .3,
                    width: width,
                    child: chargementNotif ? Container() : Notifications(),
                    decoration: BoxDecoration(color: ROSE_CLAIR, boxShadow: [
                      BoxShadow(
                        color: GRIS.withOpacity(.2),
                        offset: Offset(0.0, -10.0), //(x,y)
                        spreadRadius: -6.0,
                        blurRadius: 2.0,
                      )
                    ]),
                  )),
              Positioned(
                  top: heigth * .35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: chargement ? heigth * .3 : heigth * .5,
                      width: width,
                      // color: VERT,
                      child: chargement
                          ? Center(
                              child: Container(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  backgroundColor: BLANC,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      LINEAR1),
                                ),
                              ),
                            )
                          : CardPageBody(
                              choix: appState.listeMenu
                                  .where((element) => element.isActive)
                                  .toList()
                                  .first
                                  .choix),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

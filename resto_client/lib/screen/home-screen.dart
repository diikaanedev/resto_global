import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:resto_client/main.dart';
import 'package:resto_client/model/list-plat.dart';
import 'package:resto_client/utils/colors-by-dii.dart';
import 'package:resto_client/widget/card-list-cmd.dart';
import 'package:resto_client/widget/card-plat-list-view.dart';
import 'package:resto_client/widget/card-screen-cmd-quantite.dart';
import 'package:resto_client/widget/card-screen-valid-call-server.dart';
import 'package:resto_client/widget/card-screen-valid-cmd.dart';
import 'package:resto_client/widget/footer-screen-view.dart';
import 'package:resto_client/widget/menu-card-row.dart';
import 'package:resto_client/widget/menu-liste-plats.dart';
import 'package:resto_client/widget/top-screen-logo.dart';
import 'dart:ui' as ui;

_HomeScreenState homeScreenState;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    homeScreenState = _HomeScreenState();
    return homeScreenState;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  double heigth;
  double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    heigth =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: heigth,
              width: width,
              color: BLANC,
            ),
            Positioned(
                top: heigth * .007,
                child: Container(
                  height: heigth * .05,
                  width: width,
                  child: TopScreenLogo(),
                  // color: ROUGE,
                )),
            Positioned(
                top: heigth * .06,
                child: Container(
                  height: heigth * .13,
                  width: width,
                  child: MenuCardRow(),
                  // color: ROUGE,
                )),
            Positioned(
                top: heigth * .22,
                child: Container(
                  height: heigth * .45,
                  width: width,
                  // color: ROUGE,
                  decoration: BoxDecoration(
                    color: BLANC,
                    boxShadow: [
                      BoxShadow(
                        color: ROUGE.withOpacity(.3),
                        offset: Offset(0.0, 10.0), //(x,y)
                        spreadRadius: -6.0,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: CarouselSlider(
                    items: getListePlat(
                        choix: appState.listeMenu
                            .where((element) => element.isActive)
                            .first
                            .choix),
                    options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: .8,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.easeInExpo,
                    ),
                  ),
                )),
            Positioned(
                top: heigth * .675,
                child: Container(
                  height: heigth * .2,
                  width: width,
                  // color: VERT,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: heigth * .04,
                        // color: VERT,
                        child: Center(
                            child: Text(
                          'Liste des commandes',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                      ),
                      // Spacer(),
                      Container(
                        height: heigth * .15,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(8),
                          children: getListeCmd(),
                        ),
                      ),
                      // Spacer(),
                    ],
                  ),
                )),
            Positioned(
                bottom: 0,
                child: Container(
                  height: heigth * .15,
                  width: width,
                  color: BLANC,
                  child: FooterScreenView(),
                )),
            Positioned(
                bottom: heigth * .15 - 1.5,
                left: width * .2,
                child: Container(
                  height: 3,
                  width: width * .6,
                  decoration: BoxDecoration(
                      color: ROUGE, borderRadius: BorderRadius.circular(1)),
                )),
            appState.isShowListPlat
                ? Positioned(
                    top: heigth * .5,
                    left: width * .050,
                    child: Container(
                      height: heigth * .6,
                      width: width * .8,
                      color: BLANC,
                      child: MenuListePlats(),
                    ))
                : Container(),
            appState.isShowDialogAchat
                ? Positioned(
                    child: GestureDetector(
                    onTap: () {
                      appState.setState(() {
                        // appState.isShowDialogAchat = true;
                      });
                    },
                    child: Container(
                        height: heigth,
                        width: width,
                        child: new BackdropFilter(
                          filter:
                              new ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                          child: new Container(
                            //you can change opacity with color here(I used black) for background.
                            decoration: new BoxDecoration(
                                color: BLANC.withOpacity(0.7)),
                          ),
                        )),
                  ))
                : Container(),
            appState.isShowDialogAchat
                ? Positioned(
                    top: heigth * .4,
                    left: width * .1,
                    child: Card(
                      elevation: 2,
                      color: BLANC,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: heigth * .25,
                        width: width * .8,
                        child: CardScreenCmdQuantite(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ))
                : Container(),
            appState.isShowDialogValidCmd
                ? Positioned(
                    child: GestureDetector(
                    onTap: () {
                      appState.setState(() {
                        appState.isShowDialogValidCmd = false;
                      });
                    },
                    child: Container(
                        height: heigth,
                        width: width,
                        child: new BackdropFilter(
                          filter:
                              new ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                          child: new Container(
                            //you can change opacity with color here(I used black) for background.
                            decoration: new BoxDecoration(
                                color: BLANC.withOpacity(0.7)),
                          ),
                        )),
                  ))
                : Container(),
            appState.isShowDialogValidCmd
                ? Positioned(
                    top: heigth * .4,
                    left: width * .1,
                    child: Card(
                      elevation: 2,
                      color: BLANC,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: heigth * .2,
                        width: width * .8,
                        child: CardScreenValidCmd(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ))
                : Container(),
            appState.isShowDialogValidCallServer
                ? Positioned(
                    child: GestureDetector(
                    onTap: () {
                      appState.setState(() {
                        appState.isShowDialogValidCallServer = false;
                      });
                    },
                    child: Container(
                        height: heigth,
                        width: width,
                        child: new BackdropFilter(
                          filter:
                              new ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                          child: new Container(
                            //you can change opacity with color here(I used black) for background.
                            decoration: new BoxDecoration(
                                color: BLANC.withOpacity(0.7)),
                          ),
                        )),
                  ))
                : Container(),
            appState.isShowDialogValidCallServer
                ? Positioned(
                    top: heigth * .4,
                    left: width * .1,
                    child: Card(
                      elevation: 2,
                      color: BLANC,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: heigth * .2,
                        width: width * .8,
                        child: CardScreenValidServerCall(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}

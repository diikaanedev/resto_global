import 'package:flutter/material.dart';
import 'package:resto_client/model/list-plat.dart';
import 'package:resto_client/model/menu-model.dart';
import 'package:resto_client/model/plat-model.dart';
// import 'package:flutter/services.dart';
import 'package:resto_client/screen/home-screen.dart';

void main() {
  // SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

_MyAppState appState;

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() {
    appState = _MyAppState();
    return appState;
  }
}

class _MyAppState extends State<MyApp> {
  List<MenuModel> listeMenu = [
    MenuModel(
        name: "Les paninis",
        urlTofActif: "assets/images/entre_white.png",
        urlTofInactif: "assets/images/entre.png",
        isActive: true,
        choix: 1),
    MenuModel(
        name: "Nos pizzas",
        urlTofActif: "assets/images/resistance_white.png",
        urlTofInactif: "assets/images/resistance.png",
        isActive: false,
        choix: 2),
    MenuModel(
        name: "Desserts",
        urlTofActif: "assets/images/dessert_white.png",
        urlTofInactif: "assets/images/dessert.png",
        isActive: false,
        choix: 3),
  ];
  List<PlatModel> listePlatEntre = [];
  List<PlatModel> listePlatResistances = [];
  List<PlatModel> listePlatDesserts = [];

  List<PlatModel> listeCmd = [];
  PlatModel platModelSelect = PlatModel(name: '', price: 0, urlTof: '');

  bool isShowListPlat = false;
  bool isShowDialogAchat = false;
  bool isShowDialogValidCmd = false;
  bool isShowDialogValidCallServer = false;
  int devis = 0;
  @override
  void initState() {
    setState(() {
      listePlatEntre = listeEntreesData;
      listePlatResistances = listeResistanceData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resto.0',
      theme: ThemeData(fontFamily: 'Lato'),
      home: HomeScreen(),
    );
  }

  int getPrice() {
    int price = 0;
    if (appState.listeCmd.length == 0) {
      return 0;
    }
    for (var item in appState.listeCmd) {
      price = price + (item.price * item.quantite);
    }
    return convertToDevise(price: price);
  }

  int convertToDevise({int price}) {
    if (appState.devis == 0) {
      return price;
    } else if (appState.devis == 1) {
      return (price * 0.0015).toInt();
    } else if (appState.devis == 2) {
      return (price * 0.0018).toInt();
    } else if (appState.devis == 3) {
      return (price * 0.19).toInt();
    }
    return 0;
  }
}

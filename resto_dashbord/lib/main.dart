import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resto_dashbord/model/commande-model.dart';
import 'package:resto_dashbord/model/menu-model.dart';
import 'package:resto_dashbord/model/notification-model.dart';
import 'package:resto_dashbord/model/plat-model.dart';
import 'package:resto_dashbord/screen/home-screen.dart';
import 'package:resto_dashbord/utils/list-data.dart';

void main() {
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

// final PRICE_FORMAT = new NumberFormat("#,###", "en_US");

class _MyAppState extends State<MyApp> {
  List<MenuModel> listeMenu = [
    MenuModel(
        name: "Commandes",
        urlTofActif: "assets/images/icon_commandes.png",
        urlTofInactif: "assets/images/icon_commandes-white.png",
        isActive: true,
        choix: 1),
    MenuModel(
        name: "En cours",
        urlTofActif: "assets/images/en_cour.png",
        urlTofInactif: "assets/images/en_cour_white.png",
        isActive: false,
        choix: 2),
    MenuModel(
        name: "Archives",
        urlTofActif: "assets/images/icon_archive.png",
        urlTofInactif: "assets/images/icon_archives-white.png",
        isActive: false,
        choix: 3),
  ];

  List<NotificationModel> listeNotif = [];

  List<Commande> listeCmd = [];
  List<Commande> listeCmdEnCour = [];
  Commande commande =
      Commande(table: '', heureCmd: '', listePLat: [], price: 0, id: 0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(TabBarDemo());
// }

// class TabBarDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           appBar: AppBar(
//             elevation: 0,
//             bottom: TabBar(
//               tabs: [
//                 Tab(icon: Icon(Icons.directions_car)),
//                 Tab(icon: Icon(Icons.directions_transit)),
//                 Tab(icon: Icon(Icons.directions_transit)),
//                 Tab(icon: Icon(Icons.directions_bike)),
//               ],
//             ),
//             title: Text('Tabs Demo'),
//           ),
//           body: TabBarView(
//             physics: BouncingScrollPhysics(),
//             children: [
//               Icon(Icons.directions_car),
//               Icon(Icons.directions_transit),
//               Icon(Icons.directions_bike),
//               Icon(Icons.directions_transit),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:resto_dashbord/main.dart';
import 'package:resto_dashbord/widget/card-notification.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              // color: VERT,
            ),
            Positioned(
                child: Container(
              height: constraints.maxHeight * .25,
              width: constraints.maxWidth,
              child: Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth * .1,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Icon ionic-ios-notifications.png'))),
                  ),
                  Text(
                    'Notifications'.toUpperCase(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                ],
              ),
            )),
            Positioned(
                top: constraints.maxHeight * .26,
                child: Container(
                  height: constraints.maxHeight * .7,
                  width: constraints.maxWidth,
                  // color: VERT,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(4),
                    children: getList(),
                  ),
                ))
          ],
        );
      },
    );
  }

  List<Widget> getList() {
    List<Widget> listes = [];
    listes.add(SizedBox(
      width: 50,
    ));
    for (var item in appState.listeNotif) {
      listes.add(CardNotification(
        notificationModel: item,
      ));
      listes.add(SizedBox(
        width: 20,
      ));
    }
    return listes;
  }
}

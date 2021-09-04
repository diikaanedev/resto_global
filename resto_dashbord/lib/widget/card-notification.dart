import 'package:flutter/material.dart';
import 'package:resto_dashbord/model/notification-model.dart';
import 'package:resto_dashbord/utils/colors-by-dii.dart';
import 'package:resto_dashbord/utils/web-by-dii.dart';

class CardNotification extends StatefulWidget {
  final NotificationModel notificationModel;

  const CardNotification({Key key, this.notificationModel}) : super(key: key);
  @override
  _CardNotificationState createState() => _CardNotificationState();
}

class _CardNotificationState extends State<CardNotification> {
  Size size;
  bool chargement = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async {
        UtilsHttp.updateByIssa(
                {"id": '${widget.notificationModel.id}'}, 'notification')
            .then((result) {
          setState(() {
            chargement = true;
          });
        });
      },
      child: Stack(
        children: [
          Container(
            height: size.height * .2,
            width: size.width * .2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: widget.notificationModel.typeNotif ? BLANC : BLUE,
            ),
          ),
          chargement
              ? Positioned(
                  top: 15,
                  left: size.width * .05,
                  child: Container(
                    height: size.height * .07,
                    width: size.width * .1,
                    child: Center(
                      child: Container(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          backgroundColor: BLUE,
                          valueColor: new AlwaysStoppedAnimation<Color>(BLANC),
                        ),
                      ),
                    ),
                  ),
                )
              : Positioned(
                  top: 15,
                  left: size.width * .05,
                  child: Container(
                    height: size.height * .07,
                    width: size.width * .1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.notificationModel.typeNotif
                                ? 'assets/images/Icon feather-phone-call.png'
                                : 'assets/images/Icon awesome-check.png'))),
                  )),
          Positioned(
              top: size.height * .1,
              left: size.width * .025,
              child: Container(
                height: size.height * .05,
                width: size.width * .15,
                // color: VERT,
                child: Center(
                  child: Text(
                    widget.notificationModel.typeNotif
                        ? 'Demande Serveur'
                        : 'Serveur Appelé',
                    style: TextStyle(
                        color:
                            widget.notificationModel.typeNotif ? NOIR : BLANC),
                  ),
                ),
              )),
          Positioned(
              top: size.height * .13,
              left: size.width * .025,
              child: Container(
                height: size.height * .05,
                width: size.width * .15,
                // color: VERT,
                child: Center(
                  child: Text(
                    'Table ${widget.notificationModel.table}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            widget.notificationModel.typeNotif ? NOIR : BLANC),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

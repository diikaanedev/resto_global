import 'package:flutter/material.dart';
import 'package:resto_dashbord/utils/colors-by-dii.dart';

class TopNavProfile extends StatefulWidget {
  @override
  _TopNavProfileState createState() => _TopNavProfileState();
}

class _TopNavProfileState extends State<TopNavProfile> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Row(
            children: [
              SizedBox(
                width: constraints.maxWidth * .02,
              ),
              Container(
                width: constraints.maxWidth * .035,
                height: constraints.maxHeight * .6,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(constraints.maxHeight * .6),
                  image: DecorationImage(
                      image: AssetImage('assets/images/avatar.png'),
                      fit: BoxFit.cover),
                  color: GRIS,
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * .005,
              ),
              Container(
                width: constraints.maxWidth * .2,
                // color: VERT,
                child: Column(
                  children: [
                    Spacer(),
                    Spacer(),
                    Container(
                      height: constraints.maxHeight * .3,
                      width: constraints.maxWidth * .2,
                      // color: NOIR,
                      child: Text(
                        'Bienvenue , Kader',
                        style: TextStyle(color: GRIS, fontSize: 14),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: constraints.maxHeight * .4,
                      width: constraints.maxWidth * .2,
                      child: Text(
                        'DASHBOARD',
                        style: TextStyle(color: NOIR, fontSize: 20),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                  width: constraints.maxWidth * .3,
                  height: constraints.maxHeight * .75,
                  child: Row(
                    children: [
                      Spacer(),
                      Spacer(),
                      Container(
                        child: Icon(Icons.search),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * .02,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: BLANC,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Spacer(),
              // Spacer(),
              // Container(
              //   width: constraints.maxWidth * .05,
              //   height: constraints.maxHeight * .5,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage(
              //               'assets/images/Icon ionic-ios-notifications.png'))),
              //   // color: VERT,
              // ),
              // Spacer(),
              Container(
                width: constraints.minWidth * .3,
                // color: GRIS,
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                          'assets/images/Icon ionic-ios-settings.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'REGLAGE',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:resto_dashbord/main.dart';
import 'package:resto_dashbord/model/commande-model.dart';
import 'package:resto_dashbord/model/plat-model.dart';
import 'package:resto_dashbord/screen/home-screen.dart';
import 'package:resto_dashbord/utils/colors-by-dii.dart';
import 'package:resto_dashbord/utils/price-by-dii.dart';
import 'package:resto_dashbord/utils/web-by-dii.dart';

class CardListCmdEnCourItem extends StatefulWidget {
  final Commande commande;

  const CardListCmdEnCourItem({Key key, this.commande}) : super(key: key);
  @override
  _CardListCmdEnCourItemState createState() => _CardListCmdEnCourItemState();
}

class _CardListCmdEnCourItemState extends State<CardListCmdEnCourItem> {
  Size size;
  bool active = false;
  bool chargement = false;
  // bool isValid = false;
  // bool afterTreament = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return
        //  afterTreament
        //     ? Container(
        //         width: size.width * .35,
        //         height: size.height * .3,
        //         child: Card(
        //           elevation: 1,
        //           color: Color.fromRGBO(249, 249, 249, 1),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //           ),
        //           child: Container(
        //             height: size.height * .3,
        //             width: size.width * .35,
        //             child: Center(
        //               child: Container(
        //                 height: size.height * .15,
        //                 width: size.width * .1,
        //                 decoration: BoxDecoration(
        //                     image: DecorationImage(
        //                         image:
        //                             AssetImage('assets/images/icon_archive.png'))),
        //               ),
        //             ),
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(30),
        //                 color: Color.fromRGBO(249, 249, 249, 1)),
        //             // color: GRIS,
        //           ),
        //         ),
        //       )
        // :
        Stack(
      children: [
        Container(
          width: size.width * .35,
          height: size.height * .4,
        ),
        Positioned(
          top: size.height * .028,
          child: Container(
            height: active ? size.height * .4 : size.height * .27,
            width: size.width * .35,
            // color: NOIR,
            child: Center(
              child: Card(
                elevation: 1,
                color: Color.fromRGBO(249, 249, 249, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: active ? size.height * .35 : size.height * .3,
                  width: size.width * .35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(249, 249, 249, 1)),
                  // color: GRIS,
                ),
              ),
            ),
          ),
        ),
        Positioned(
            right: size.width * .08,
            top: size.height * .03,
            child: Container(
              height: size.height * .005,
              width: size.width * .1,
              decoration: BoxDecoration(
                  color: LINEAR1, borderRadius: BorderRadius.circular(2)),
            )),
        Positioned(
            right: size.width * .05,
            top: -5,
            child: Container(
              height: size.height * .04,
              width: size.width * .15,
              // color: VERT,
              child: Center(
                  child: Text(
                'Table ${widget.commande.table}',
                style: TextStyle(
                    fontSize: 18, color: LINEAR1, fontWeight: FontWeight.bold),
              )),
            )),
        Positioned(
            left: size.width * .05,
            top: -5,
            child: Container(
              height: size.height * .05,
              width: size.width * .15,
              // color: VERT,
              child: Center(
                  child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Icon material-access-time.png'))),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'il y\'a ${widget.commande.heureCmd} min',
                    style: TextStyle(
                        fontSize: 12,
                        color: LINEAR1,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )),
            )),
        Positioned(
          top: size.height * .06,
          left: size.width * .025,
          child: GestureDetector(
            onTap: () {
              setState(() {
                active = !active;
              });
            },
            child: Container(
              height: active ? size.height * .35 : size.height * .3,
              width: size.width * .35,
              // color: VERT,
              child: Column(
                children: [
                  Container(
                    height: active ? size.height * .15 : size.height * .15,
                    // color: VERT,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(4),
                      children: getListePlat(),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: active ? size.height * .07 : size.height * .05,
                    // color: VERT,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          // width: size.width * .15,
                          child: Text(
                            'FACTURE',
                            style: TextStyle(
                                color: LINEAR1,
                                fontSize: 22,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 2,
                          height: size.height * .04,
                          color: BLANC,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${PRICE_FORMAT.format(widget.commande.price)} FCFA',
                          style: TextStyle(
                              color: LINEAR1,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (active)
          Positioned(
              bottom: size.height * .1,
              left: size.width * .075,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      chargement = true;
                    });
                    UtilsHttp.updateByIssa(
                            {"id": '${widget.commande.id}', "status": "2"},
                            'commande')
                        .then((result) {
                      print(result.statusCode);
                      setState(() {
                        chargement = false;
                        // isValid = true;
                        active = false;
                        // afterTreament = true;
                      });
                    });
                  },
                  child: Card(
                    elevation: 2,
                    color: BLUE,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: size.height * .06,
                      width: size.width * .2,
                      decoration: BoxDecoration(
                          color: BLUE, borderRadius: BorderRadius.circular(10)),
                      // color: VERT,
                      child: Center(
                        child: chargement
                            ? Center(
                                child: Container(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  backgroundColor: BLUE,
                                  valueColor:
                                      new AlwaysStoppedAnimation<Color>(BLANC),
                                ),
                              ))
                            : Text(
                                ' Commande Terminée ',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: BLANC),
                              ),
                      ),
                    ),
                  )))
      ],
    );
  }

  List<Widget> getListePlat() {
    List<Widget> liste = [];
    for (var item in widget.commande.listePLat) {
      liste.add(getRowItemPlatItem(platModel: item));
    }
    return liste;
  }

  Widget getRowItemPlatItem({PlatModel platModel}) {
    return Container(
      height: size.height * .035,
      width: size.width * 2,
      // color: VERT,
      child: Row(
        children: [
          Spacer(),
          Container(
            width: size.width * .05,
            child: Text(
              '${platModel.quantite}  -',
              style: TextStyle(color: LINEAR1, fontSize: 18),
            ),
          ),
          Spacer(),
          Container(
            width: size.width * .15,
            child: Text(
              '${platModel.name}  ',
              style: TextStyle(color: LINEAR1, fontSize: 18),
            ),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}

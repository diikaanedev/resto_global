import 'package:flutter/material.dart';
import 'package:resto_client/utils/colors-by-dii.dart';

class TopScreenLogo extends StatefulWidget {
  @override
  _TopScreenLogoState createState() => _TopScreenLogoState();
}

class _TopScreenLogoState extends State<TopScreenLogo> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight * .7,
          width: constraints.maxHeight * .6,
          // color: VERT,
          child: Row(
            children: [
              Spacer(),
              Text(
                'MENU',
                style: TextStyle(
                    color: GRIS_LEGER,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                ' Chez Katia',
                style: TextStyle(
                    fontFamily: 'Satisfy',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: ROUGE),
              ),
              Spacer()
            ],
          ),
        );
      },
    );
  }
}

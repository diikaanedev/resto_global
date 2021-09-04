import 'package:flutter/material.dart';
import 'package:resto_client/utils/colors-by-dii.dart';

class CardScreenValidCmd extends StatefulWidget {
  @override
  _CardScreenValidCmdState createState() => _CardScreenValidCmdState();
}

class _CardScreenValidCmdState extends State<CardScreenValidCmd> {
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
              Container(
                height: constraints.maxHeight * .4,
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: VERT,
                    size: constraints.maxHeight * .4,
                  ),
                ),
              ),
              // Spacer(),
              Container(
                height: constraints.maxHeight * .12,
                child: Center(
                  child: Text(
                    'Commande transmise avec',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * .12,
                child: Center(
                  child: Text(
                    'succes',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Spacer(),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}

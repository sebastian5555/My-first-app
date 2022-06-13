// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class rowfield extends StatefulWidget {
  final String displayFText;
  final String displaySText;
  final String type;

  const rowfield({
    Key? key,
    required this.displayFText,
    required this.displaySText,
    required this.type,
  }) : super(key: key);

  @override
  rowfieldState createState() => rowfieldState();
}

class rowfieldState extends State<rowfield> {
  late TextStyle style;

  TextStyle decide(value) {
    if (value == 'title') {
      style = const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
      return style;
    } else {
      style = const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Color.fromARGB(255, 43, 1, 51));
      return style;
    }
  }

  //rowType(widget.type);
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.displayFText,
            textAlign: TextAlign.center,
            style: decide(widget.type),
          ),
          Text(
            widget.displaySText,
            style: decide(widget.type),
          )
        ],
      );
}

 // Widget rowType(String value) {
  //   if (value == 'title') {
  //     return Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         Text(
  //           widget.displayFText,
  //           textAlign: TextAlign.center,
  //           style: const TextStyle(
  //               fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  //         ),
  //         Text(
  //           widget.displaySText,
  //           style: const TextStyle(
  //               fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
  //         )
  //       ],
  //     );
  //   } else {
  //     return Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         Text(
  //           widget.displayFText,
  //           textAlign: TextAlign.center,
  //           style: const TextStyle(
  //               fontSize: 15,
  //               fontWeight: FontWeight.normal,
  //               color: Color.fromARGB(255, 43, 1, 51)),
  //         ),
  //         Text(
  //           widget.displaySText,
  //           style: const TextStyle(
  //               fontSize: 15,
  //               fontWeight: FontWeight.normal,
  //               color: Color.fromARGB(255, 43, 1, 51)),
  //         ),
  //       ],
  //     );
  //   }
  // }


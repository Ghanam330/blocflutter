import 'package:blocflutter/constants/my_colores.dart';
import 'package:flutter/material.dart';

class DriverWidget extends StatelessWidget {
  final double endIndent;

  DriverWidget({Key? key, required this.endIndent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2, // سمك
    );
  }
}

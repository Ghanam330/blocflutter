import 'package:blocflutter/constants/my_colores.dart';
import 'package:flutter/material.dart';

class SilverAppBarWidget extends StatelessWidget {
  final double height;
  final int id;
  final String name,background;


  const SilverAppBarWidget({Key? key,
    required this.height,
    required this.name,
    required this.background,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      expandedHeight: height,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title:Text(
          name,
          style:TextStyle(
            color: MyColors.myWhite,
          ),
        ),
        background: Hero(
            tag:id,
            child:Image.network(background,fit: BoxFit.cover,) ),
      ),
    );
  }
}
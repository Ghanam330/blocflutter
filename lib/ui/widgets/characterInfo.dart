import 'package:blocflutter/constants/my_colores.dart';
import 'package:flutter/material.dart';

class CharacterInfo extends StatelessWidget {

  final String title,value;


  const CharacterInfo({Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style:const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18
            )
          ),
          TextSpan(
              text:value,
              style:const TextStyle(
                  color: MyColors.myWhite,
                  fontSize: 16
              )
          ),
        ]
      ),

    );
  }
}
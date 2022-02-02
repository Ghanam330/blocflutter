import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatefulWidget {
  CharacterDetailsScreen();

  @override
  CharacterDetailsScreenState createState() => CharacterDetailsScreenState();
}

class CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar();
  }

  Container _buildBody() {
    return Container();
  }

}
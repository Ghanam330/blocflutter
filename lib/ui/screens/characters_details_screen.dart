import 'package:blocflutter/constants/my_colores.dart';
import 'package:blocflutter/data/model/character.dart';
import 'package:blocflutter/ui/widgets/build_driver_widget.dart';
import 'package:blocflutter/ui/widgets/characterInfo.dart';
import 'package:blocflutter/ui/widgets/silver_appbar.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          SilverAppBarWidget(
              height: 600,
              name: character.name,
              background: character.image,
              id: character.charId),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CharacterInfo(
                      title: 'Job :', value: character.jobs.join(' / ')),
                  DriverWidget(
                    endIndent: 315,
                  ),
                  CharacterInfo(
                      title: 'Appeared :',
                      value: character.categoryForTwoSeries),
                  DriverWidget(
                    endIndent: 250,
                  ),
                  CharacterInfo(
                      title: 'Seasons :',
                      value: character.appearanceOfSeasons.join(' / ')),
                  DriverWidget(
                    endIndent: 280,
                  ),
                  CharacterInfo(
                      title: 'Status :', value: character.statusIfDeadOrAlive),
                  DriverWidget(
                    endIndent: 300,
                  ),
                  character.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : CharacterInfo(
                          title: 'Better Call Saul Seasons :',
                          value:
                              character.betterCallSaulAppearance.join(' / ')),
                  character.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : DriverWidget(
                          endIndent: 150,
                        ),
                  CharacterInfo(
                      title: 'Actor/Actress :', value: character.acotrName),
                  DriverWidget(
                    endIndent: 285,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 600,
            )
          ])),
        ],
      ),
    );
  }
}

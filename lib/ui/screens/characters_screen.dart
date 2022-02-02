import 'package:blocflutter/business_logic/cubit/characters_cubit.dart';
import 'package:blocflutter/constants/my_colores.dart';
import 'package:blocflutter/data/model/character.dart';
import 'package:blocflutter/ui/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {

  late List<Character> allCharacter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    allCharacter = BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }


 Widget buidBlocWidget() {
    return BlocBuilder<CharactersCubit,CharactersState>(
        builder: (context,state){
          if(state is CharactersLoading){
            allCharacter =(state).character;

            return buildLoadingListWWidgets();
          }else{
            return showLoadingIndictor();
          }
        }
    );
  }

  Widget showLoadingIndictor(){
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }
  Widget buildLoadingListWWidgets(){
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList(){
    return GridView.builder(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allCharacter.length,
        itemBuilder: (context,index){


          return CharacterItem(
            characterItem: allCharacter[index],);
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title:const Text(
          'Characters',
          style: TextStyle(
        color: MyColors.myGrey
          ),
        ),
      ),
      body: buidBlocWidget(),
    );
  }
}

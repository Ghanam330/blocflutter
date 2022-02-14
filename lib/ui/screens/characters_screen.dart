import 'package:blocflutter/business_logic/cubit/characters_cubit.dart';
import 'package:blocflutter/constants/my_colores.dart';
import 'package:blocflutter/data/model/character.dart';
import 'package:blocflutter/ui/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatefulWidget {
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacter;
  late List<Character> searchedOfCharacter;
  bool _isSearch = false;
  final _searchTextCotroler = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextCotroler,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
        hintText: 'Find a character....',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: MyColors.myGrey,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: MyColors.myGrey,
        fontSize: 18,
      ),
      onChanged: (searchCharacter) {
        addSearchedOrItemToSearchedList(searchCharacter);
      },
    );
  }

  void addSearchedOrItemToSearchedList(String searchCharacter) {
    searchedOfCharacter = allCharacter
        .where((character) =>
            character.name.toLowerCase().startsWith(searchCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarAction() {
    if (_isSearch) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.clear,
              color: MyColors.myGrey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              _startSearch();
            },
            icon: const Icon(
              Icons.search,
            ))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearch = true;
    });
  }

  void _stopSearch() {
    _clearSearch();
    setState(() {
      _isSearch = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextCotroler.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }

  Widget buidBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoading) {
        allCharacter = (state).character;

        return buildLoadingListWWidgets();
      } else {
        return showLoadingIndictor();
      }
    });
  }

  Widget showLoadingIndictor() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadingListWWidgets() {
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

  Widget buildCharacterList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchTextCotroler.text.isEmpty
            ? allCharacter.length
            : searchedOfCharacter.length,
        itemBuilder: (context, index) {
          return CharacterItem(
            characterItem: _searchTextCotroler.text.isEmpty
                ? allCharacter[index]
                : searchedOfCharacter[index],
          );
        });
  }

  Widget buildNotInternetWidget() {
    return Center(

      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Can\'t  connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset('assets/images/waring.png')
          ],
        ),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return const Text(
      'Character',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyColors.myYellow,
          leading: _isSearch
              ? const BackButton(
                  color: MyColors.myGrey,
                )
              : Container(),
          title: _isSearch ? _buildSearchField() : _buildAppBarTitle(),
          actions: _buildAppBarAction()),
      body: OfflineBuilder(connectivityBuilder: (BuildContext context,
          ConnectivityResult connectivity, Widget child) {
        final bool connect = connectivity != ConnectivityResult.none;
        if (connect) {
          return buidBlocWidget();
        } else {
          return buildNotInternetWidget();
        }
      }),

      //
    );
  }
}

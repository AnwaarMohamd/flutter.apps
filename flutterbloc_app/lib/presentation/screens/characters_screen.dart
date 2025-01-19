import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_app/busniess_logic/cubit/characters_cubit.dart';
import 'package:flutterbloc_app/busniess_logic/cubit/characters_state.dart';
import 'package:flutterbloc_app/constants/my_colors.dart';
import 'package:flutterbloc_app/data/models/characters.dart';
import 'package:flutterbloc_app/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;
  bool _isSearching = false;
  late List<Character> searchedForCharacters;
  final _searchTextController =
      TextEditingController(); // ممكن يتعمل في ال widgets عادي

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey, // علامة الكتابة
      decoration: const InputDecoration(
          hintText: 'find a character',
          border: InputBorder.none,
          hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18)),
      style: const TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedChracter) {
        addSearchedForItemToSearchedList(
            searchedChracter); // هتاخد الحرف اللى ال user كتبه و تشتغل عليه
      },
    );
  }

  void addSearchedForItemToSearchedList(String searchedCharacters) {
    searchedForCharacters = allCharacters
        .where((character) => // هاتلي كل ال items اللي فيها كذا كذا
            character.name.toLowerCase().startsWith(searchedCharacters))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context); // اطلع مالسيرش اللى بعمله
          },
          icon: const Icon(Icons.clear, color: MyColors.myGrey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(Icons.search, color: MyColors.myGrey),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
        onRemove: _stopSearching)); // ال back bottom في زرار ال search
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state)
              .characters; // الليسته بتاعت ال characters الموجودة فال state اللى فال char.loaded
          return buildLoadedListWidgets();
        } else {
          return showLoadingListWidget();
        }
      },
    );
  }

  Widget showLoadingListWidget() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(), // بيخلي ال grid تشتغل بطريقه احسن
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedForCharacters
              .length, // لو انا مش بعمل search على حاجه اعرضلي allcharacters غير كدا اعرضلي الحاجه اللى ببحث عليها
      itemBuilder: (ctx, index) {
        return CharacterItem(
          character: _searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedForCharacters[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return const Text("Characters",
        style: TextStyle(
          color: MyColors.myGrey,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(), // function
    );
  }
}

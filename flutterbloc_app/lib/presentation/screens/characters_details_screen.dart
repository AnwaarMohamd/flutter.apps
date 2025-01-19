import 'package:flutter/material.dart';
import 'package:flutterbloc_app/constants/my_colors.dart';
import 'package:flutterbloc_app/data/models/characters.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character});
  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  Widget buildSliverAppBar(dynamic character) {
    // character كان فيها error
    return SliverAppBar(
      // نتحكم فالصوره او الاسم
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.nickName,
          style: TextStyle(color: MyColors.myWhite),
          // textAlign: TextAlign.start,
        ),
        background: Hero(
            tag: character.charId,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(delegate: SliverChildListDelegate(children)),
        ],
      ),
    );
  }
}

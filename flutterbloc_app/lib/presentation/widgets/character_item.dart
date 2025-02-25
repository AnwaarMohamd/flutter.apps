import 'package:flutter/material.dart';
import 'package:flutterbloc_app/constants/my_colors.dart';
import 'package:flutterbloc_app/constants/strings.dart';
import 'package:flutterbloc_app/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character; // الcharacter الواحد اللى جوا الmodel

  const CharacterItem({super.key, required this.character});
  @override
  Widget build(BuildContext context) {
    return Container(
        // هعمل شكل الصورة الواحدة هيبقى عامل ازاي
        width: double.infinity,
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: MyColors.myWhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, charactersDetailsScreen,
              arguments: character),
          child: GridTile(
            child: Hero(
              tag: character.charId, //بديله نفس القيمه فالصفحة التانيه 
              child: Container(
                color: MyColors.myGrey,
                child: character.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: double.infinity,
                        placeholder:
                            'assets/images/loading.gif', // from lottie animation
                        image: character.image,
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/images/placeholder.png'),
              ),
            ),
            footer: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                '${character.name}',
                style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                ),
                overflow:
                    TextOverflow.ellipsis, // حط نقط فالاخر لو جايلى اسم طويل
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}

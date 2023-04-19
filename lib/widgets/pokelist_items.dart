import 'package:flutter/material.dart';
import 'package:flutter_pokemon/constants/constants.dart';
import 'package:flutter_pokemon/constants/ui_helper.dart';

import 'package:flutter_pokemon/model/pokemon_model.dart';
import 'package:flutter_pokemon/pages/detail_page.dart';
import 'package:flutter_pokemon/widgets/poke_image_ball.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.w),
          ),
          elevation: 3,
          shadowColor: Colors.white,
          color: UiHelper.getColorFromType(pokemon.type![0]),
          child: Padding(
            padding: UiHelper.getDefaultPadding(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name ?? 'N/A',
                  style: Constants.getPokemonNameTextStyle(),
                ),
                Chip(
                  label: Text(
                    pokemon.type![0],
                  ),
                ),
                Expanded(child: PokeImageAndBall(pokemon: pokemon))
              ],
            ),
          )),
    );
  }
}

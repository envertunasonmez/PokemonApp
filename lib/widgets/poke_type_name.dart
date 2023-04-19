import 'package:flutter/material.dart';
import 'package:flutter_pokemon/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class PokeNameType extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeNameType({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  pokemon.name ?? '',
                  style: Constants.getPokemonNameTextStyle(),
                ),
              ),
              Text(
                '#${pokemon.num}',
                style: Constants.getPokemonNameTextStyle(),
              ),
            ],
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          Chip(
            label: Text(
              pokemon.type?.join(' , ') ?? '',
              style: Constants.getTypeChipTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pokemon/constants/ui_helper.dart';
import 'package:flutter_pokemon/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: UiHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name', pokemon.name),
            _buildInformationRow('Height', pokemon.height),
            _buildInformationRow('Weight', pokemon.weight),
            _buildInformationRow('Spawn Time', pokemon.spawnTime),
            _buildInformationRow('Weaknesses', pokemon.weaknesses),
            _buildInformationRow('Pre Evolution', pokemon.prevEvolution),
            _buildInformationRow('Next Evolution', pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }
}

_buildInformationRow(String label, dynamic value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: Constants.getPokeInfoLabelStyle(),
      ),
      if (value is List && value.isEmpty)
        Text(
          value.join(' , '),
          style: Constants.getPokemonNameTextStyle(),
        )
      else if (value == null)
        Text(
          'Not available',
          style: Constants.getPokemonNameTextStyle(),
        )
      else
        Text(value.toString()),
    ],
  );
}

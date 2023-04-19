import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/constants/ui_helper.dart';

import '../model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImageAndBall({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            width: UiHelper.calculatePokeImageAndBallSize(),
            height: UiHelper.calculatePokeImageAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
              width: UiHelper.calculatePokeImageAndBallSize(),
              height: UiHelper.calculatePokeImageAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => CircularProgressIndicator(
                color: UiHelper.getColorFromType(pokemon.type![0]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

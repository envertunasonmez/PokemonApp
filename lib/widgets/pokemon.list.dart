// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_pokemon/widgets/pokelist_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/pokemon_model.dart';
import '../services/pokodex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonList;
  @override
  void initState() {
    super.initState();
    _pokemonList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('pokemon list build calıstı');
    return FutureBuilder<List<PokemonModel>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> listem = snapshot.data!;
            return GridView.builder(
                itemCount: listem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ScreenUtil().orientation == Orientation.portrait
                            ? 2
                            : 3),
                itemBuilder: (context, index) {
                  debugPrint('item builder calıstı');
                  return PokeListItem(pokemon: listem[index]);
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('hata çıktı'),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
// ListView.builder(
//               itemCount: _listem.length,
//               itemBuilder: (context, index) {
//                 var oankiPokemon = _listem[index];
//                 return PokeListItem(pokemon: oankiPokemon);
//               },
//             );
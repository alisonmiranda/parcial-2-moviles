import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/post_viewmodel.dart';
import 'pokemon_detail_page.dart';
import '../themes/indice.dart';

class PokemonGridView extends StatelessWidget {
  const PokemonGridView({super.key});

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return ColoresApp.tipFuego;
      case 'water':
        return ColoresApp.tipAgua;
      case 'grass':
        return ColoresApp.tipPlanta;
      case 'electric':
        return ColoresApp.tipElectrico;
      case 'psychic':
        return ColoresApp.tipPsiquico;
      case 'ice':
        return ColoresApp.tipHielo;
      case 'dragon':
        return ColoresApp.tipDragon;
      case 'dark':
        return ColoresApp.tipSiniestro;
      case 'fairy':
        return ColoresApp.tipHada;
      case 'normal':
        return ColoresApp.tipNormal;
      case 'fighting':
        return ColoresApp.tipLucha;
      case 'flying':
        return ColoresApp.tipVolador;
      case 'poison':
        return ColoresApp.tipVeneno;
      case 'ground':
        return ColoresApp.tipTierra;
      case 'rock':
        return ColoresApp.tipRoca;
      case 'bug':
        return ColoresApp.tipBicho;
      case 'ghost':
        return ColoresApp.tipFantasma;
      case 'steel':
        return ColoresApp.tipAcero;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PokemonViewModel>();
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: vm.pokemons.length,
      itemBuilder: (context, i) {
        final pokemon = vm.pokemons[i];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PokemonDetailPage(pokemon: pokemon),
              ),
            );
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pokemon.name.toUpperCase(),
                  style: TipografiaApp.nombrePokemon.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: pokemon.types.map((type) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _getTypeColor(type),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        type.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

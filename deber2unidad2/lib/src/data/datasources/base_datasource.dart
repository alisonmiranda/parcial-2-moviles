import '../models/post_model.dart';

abstract class BaseDataSource {
  Future<List<PokemonModel>> fetchPokemons();
  Future<PokemonModel> getPokemon(int id);
}

import '../models/post_model.dart';

abstract class BaseDataSource {
  Future<List<PokemonModel>> fetchPokemons({required int limit, required int offset});
  Future<PokemonModel> getPokemon(int id);
}

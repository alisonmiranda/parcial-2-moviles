import '../../domain/entities/post_entity.dart';

abstract class BaseRepository {
  Future<List<PokemonEntity>> getPokemons();
  Future<PokemonEntity> getPokemonById(int id);
}

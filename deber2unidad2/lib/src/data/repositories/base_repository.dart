import '../../domain/entities/post_entity.dart';

abstract class BaseRepository {
  Future<List<PokemonEntity>> getPokemons({required int limit, required int offset});
  Future<PokemonEntity> getPokemonById(int id);
}

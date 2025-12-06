import '../../domain/entities/post_entity.dart';
import '../datasources/base_datasource.dart';
import 'base_repository.dart';

class PokemonRepositoryImpl implements BaseRepository {
  final BaseDataSource ds;

  PokemonRepositoryImpl(this.ds);

  @override
  Future<List<PokemonEntity>> getPokemons() {
    return ds.fetchPokemons();
  }

  @override
  Future<PokemonEntity> getPokemonById(int id) {
    return ds.getPokemon(id);
  }
}

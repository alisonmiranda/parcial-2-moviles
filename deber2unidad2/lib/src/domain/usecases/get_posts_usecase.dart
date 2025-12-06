import '../entities/post_entity.dart';
import '../../data/repositories/base_repository.dart';

class GetPokemonsUseCase {
  final BaseRepository repository;

  GetPokemonsUseCase(this.repository);

  Future<List<PokemonEntity>> call() {
    return repository.getPokemons();
  }
}

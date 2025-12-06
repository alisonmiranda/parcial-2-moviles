import '../../domain/entities/post_entity.dart';
import '../../domain/usecases/get_posts_usecase.dart';
import '../../domain/usecases/get_post_by_id_usecase.dart';
import 'base_viewmodel.dart';

class PokemonViewModel extends BaseViewModel {
  final GetPokemonsUseCase getPokemonsUseCase;
  final GetPokemonByIdUseCase getPokemonByIdUseCase;

  List<PokemonEntity> pokemons = [];
  PokemonEntity? selectedPokemon;
  String? errorMessage;

  PokemonViewModel({
    required this.getPokemonsUseCase,
    required this.getPokemonByIdUseCase,
  });

  Future<void> cargarPokemons() async {
    setLoading(true);
    errorMessage = null;
    try {
      pokemons = await getPokemonsUseCase();
    } catch (e) {
      errorMessage = 'Error al cargar pokémon: $e';
      pokemons = [];
    }
    setLoading(false);
  }

  Future<void> cargarPokemonPorId(int id) async {
    setLoading(true);
    errorMessage = null;
    try {
      selectedPokemon = await getPokemonByIdUseCase(id);
    } catch (e) {
      errorMessage = 'Error al cargar pokémon: $e';
      selectedPokemon = null;
    }
    setLoading(false);
  }
}

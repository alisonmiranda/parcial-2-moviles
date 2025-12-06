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

  int _offset = 0;
  final int _limit = 20;
  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  PokemonViewModel({
    required this.getPokemonsUseCase,
    required this.getPokemonByIdUseCase,
  });

  Future<void> cargarPokemons() async {
    setLoading(true);
    errorMessage = null;
    _offset = 0;
    try {
      pokemons = await getPokemonsUseCase(limit: _limit, offset: _offset);
      _offset += _limit;
    } catch (e) {
      errorMessage = 'Error al cargar pokémon: $e';
      pokemons = [];
    }
    setLoading(false);
  }

  Future<void> cargarMasPokemons() async {
    if (_isLoadingMore) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      final newPokemons = await getPokemonsUseCase(limit: _limit, offset: _offset);
      pokemons.addAll(newPokemons);
      _offset += _limit;
    } catch (e) {
      // Opcional: manejar el error de "cargar más" de alguna manera
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
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

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_datasource.dart';
import '../models/post_model.dart';

class PokemonApiDataSource implements BaseDataSource {
  final String baseUrl = "https://pokeapi.co/api/v2/pokemon";

  @override
  Future<List<PokemonModel>> fetchPokemons({int limit = 20, int offset = 0}) async {
    try {
      // Obtener la lista de Pokémon con paginación
      final url = Uri.parse("$baseUrl?limit=$limit&offset=$offset");
      final resp = await http.get(url);

      if (resp.statusCode != 200) {
        throw Exception("Error HTTP ${resp.statusCode}: ${resp.body}");
      }

      final dynamic decodedData = json.decode(resp.body);
      final List results = decodedData['results'] ?? [];
      
      // Obtener detalles de cada Pokémon
      List<PokemonModel> pokemons = [];
      for (var result in results) {
        try {
          final detailResp = await http.get(Uri.parse(result['url']));
          if (detailResp.statusCode == 200) {
            pokemons.add(PokemonModel.fromJson(json.decode(detailResp.body)));
          }
        } catch (e) {
          // Si falla la obtención de un pokémon, se continúa con el siguiente.
          continue;
        }
      }
      
      return pokemons;
    } catch (e) {
      throw Exception("Error al obtener pokémon: $e");
    }
  }

  @override
  Future<PokemonModel> getPokemon(int id) async {
    try {
      final url = Uri.parse("$baseUrl/$id");
      final resp = await http.get(url);

      if (resp.statusCode != 200) {
        throw Exception("Error HTTP ${resp.statusCode}: ${resp.body}");
      }

      return PokemonModel.fromJson(json.decode(resp.body));
    } catch (e) {
      throw Exception("Error al obtener pokémon: $e");
    }
  }
}

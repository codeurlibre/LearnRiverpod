import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/board_game.dart';

final repositoryProvider = Provider<WishlistRepository>((ref) => WishlistRepository());

class WishlistRepository{
  final _client = Dio(BaseOptions(
    baseUrl: "https://api.boardgameatlas.com/api",
    queryParameters: {"client_id": "8l3xEV0LlB"}
  ));

  Future<List<BoardGame>> getBoardGames()async{
    final result = await _client.get("/search?limit=20");
    final game = result.data["games"];

    return game.map<BoardGame>((game)=>BoardGame.fromJson(game)).toList();
  }
}
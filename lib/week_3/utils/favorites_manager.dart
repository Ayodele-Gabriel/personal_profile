import 'package:shared_preferences/shared_preferences.dart';

class FavoriteManager {
  static final FavoriteManager _instance = FavoriteManager._internal();
  factory FavoriteManager() => _instance;

  FavoriteManager._internal();

  final Set<String> _favoriteRecipeIds = {};

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedList = prefs.getStringList('favorite_recipes') ?? [];
    _favoriteRecipeIds.clear();
    _favoriteRecipeIds.addAll(savedList);
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorite_recipes', _favoriteRecipeIds.toList());
  }

  bool isFavorite(String recipeId) => _favoriteRecipeIds.contains(recipeId);

  Future<void> toggleFavorite(String recipeId) async {
    if (_favoriteRecipeIds.contains(recipeId)) {
      _favoriteRecipeIds.remove(recipeId);
    } else {
      _favoriteRecipeIds.add(recipeId);
    }
    await saveFavorites();
  }

  Set<String> get favorites => _favoriteRecipeIds;
}

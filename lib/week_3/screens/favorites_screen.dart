import 'package:flutter/material.dart';
import 'package:personal_profile/week_3/data/sample_recipes.dart';
import 'package:personal_profile/week_3/utils/app_colors.dart';
import 'package:personal_profile/week_3/utils/favorites_manager.dart';
import 'package:personal_profile/week_3/utils/typography.dart';
import 'package:personal_profile/week_3/widgets/recipe/recipe_card.dart';

import '../utils/responsive_breakpoints.dart';

class FavoritesScreen extends StatefulWidget {
  final List<ResponsiveRecipeCard> allRecipes;

  const FavoritesScreen({super.key, required this.allRecipes});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late List<ResponsiveRecipeCard> favoriteRecipes;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    final favoriteIds = FavoriteManager().favorites;
    favoriteRecipes = widget.allRecipes.where((r) => favoriteIds.contains(r.recipe.id)).toList();
  }

  void _removeFromFavorites(String recipeId) async {
    await FavoriteManager().toggleFavorite(recipeId);
    setState(() {
      _loadFavorites(); // refresh the list
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteIds = FavoriteManager().favorites;
    final favoriteRecipes =
        widget.allRecipes.where((r) => favoriteIds.contains(r.recipe.id)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites'), centerTitle: true),
      body:
          favoriteRecipes.isEmpty
              ? const Center(child: Text("No favorite recipes yet."))
              : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ResponsiveBreakpoints.isMobile(context)
                          ? 1
                          : ResponsiveBreakpoints.isTablet(context)
                          ? 3
                          : 4,
                ),
                itemCount: favoriteRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = favoriteRecipes[index].recipe;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => RecipeDetail(recipe: recipe)),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(20.0),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(recipe.imageUrl),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(recipe.title, style: AppTextStyles.heading2),
                                  Text(
                                    '${recipe.prepTimeMinutes + recipe.cookTimeMinutes} minutes',
                                    // style: AppTextStyles.body,
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () async {
                                  final confirm = await showDialog<bool>(
                                    context: context,
                                    builder:
                                        (_) => AlertDialog(
                                      title: Text('Remove Favorite'),
                                      content: Text(
                                        'Are you sure you want to remove "${recipe.title}" from favorites?',
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () => Navigator.pop(context, false),
                                        ),
                                        TextButton(
                                          child: Text('Remove'),
                                          onPressed: () => Navigator.pop(context, true),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (confirm == true) {
                                    _removeFromFavorites(recipe.id);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}

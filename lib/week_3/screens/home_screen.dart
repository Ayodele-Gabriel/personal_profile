import 'package:flutter/material.dart';
import 'package:personal_profile/week_3/data/sample_recipes.dart';
import 'package:personal_profile/week_3/utils/app_colors.dart';
import 'package:personal_profile/week_3/utils/routing/route_paths.dart';

import '../utils/responsive_breakpoints.dart';
import '../utils/typography.dart';
import '../widgets/recipe/recipe_card.dart';
import '../widgets/recipe/recipe_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final SearchController _searchController;
  final List<ResponsiveRecipeCard> _recipes = SampleRecipes().allRecipe;

  @override
  void initState() {
    super.initState();
    _searchController = SearchController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(context),
            SizedBox(height: 32),
            _buildQuickCategories(context),
            SizedBox(height: 32),
            _buildFeaturedRecipes(context),
            // SizedBox(height: 32),
            // _buildRecentlyViewed(context),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Recipe Book'),
      automaticallyImplyLeading: false,
      actions: [
        FoodSearch(recipes: _recipes),
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () => _navigateToShoppingList(context),
        ),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: ResponsiveBreakpoints.isMobile(context) ? 200 : 300,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.orange[400]!, Colors.deepOrange[600]!],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Recipe Book',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Discover amazing recipes for every occasion',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.white.withAlpha((0.9 * 255).toInt())),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _exploreRecipes(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.orange[600],
              ),
              child: Text('Explore Recipes'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedRecipes(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Recipes',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: () => _exploreRecipes(context), child: Text('View All')),
          ],
        ),
        ResponsiveRecipeGrid(
          recipes: SampleRecipes().featuredRecipe,
          maxItems:
              SampleRecipes()
                  .featuredRecipe
                  .length, //ResponsiveBreakpoints.isMobile(context) ? 4 : 6,
        ),
      ],
    );
  }

  Widget _buildQuickCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Categories', style: AppTextStyles.heading2),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _categoryButton(context, 'Appetizer'),
            const SizedBox(width: 8.0),
            _categoryButton(context, 'Main Dish'),
            const SizedBox(width: 8.0),
            _categoryButton(context, 'Side Dish'),
          ],
        ),
      ],
    );
  }

  _categoryButton(BuildContext context, String category) {
    return ElevatedButton(
            onPressed: () {
              final query = category;
              final List<ResponsiveRecipeCard> filteredBranch =
              _recipes
                  .where((card) => card.recipe.category.toLowerCase().contains(query.toLowerCase()))
                  .toList();

              if (filteredBranch.isNotEmpty) {
                showModalBottomSheet(
                  useSafeArea: true,
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                  ),
                  backgroundColor: AppColors.background,
                  builder: (context) {
                    return ListView.separated(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: filteredBranch.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final card = filteredBranch[index];
                        return ListTile(
                          title: Text(card.recipe.title),
                          subtitle: Text(card.recipe.category),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            Navigator.pop(context); // Close bottom sheet
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => RecipeDetail(recipe: card.recipe),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              }
            },
            child: Text(category, style: TextStyle(color: AppColors.primary)),
          );
  }

  // Widget _buildRecentlyViewed(BuildContext context) {}
  // void _showSearch(BuildContext context) {}

  void _navigateToShoppingList(BuildContext context) {
    // Navigate to shopping list
  }

  void _exploreRecipes(BuildContext context) {
    Navigator.pushNamed(context, RoutePaths.recipeDetailScreen, arguments: 'implyLeading');
  }
}

class FoodSearch extends StatelessWidget {
  const FoodSearch({super.key, required List<ResponsiveRecipeCard> recipes}) : _recipes = recipes;

  final List<ResponsiveRecipeCard> _recipes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.0,
      child: SearchAnchor.bar(
        barHintText: 'Start typing to search for a branch near you',
        barLeading: Icon(Icons.search),
        barBackgroundColor: WidgetStatePropertyAll(AppColors.background),
        barElevation: const WidgetStatePropertyAll(0.0),
        barShape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        viewBackgroundColor: AppColors.background,
        viewLeading: const SizedBox(),
        isFullScreen: false,
        viewHintText: 'Search',
        shrinkWrap: false,
        suggestionsBuilder: (context, controller) {
          final query = controller.text.toLowerCase();
          final List<ResponsiveRecipeCard> filteredBranch =
              _recipes.where((card) => card.recipe.title.toLowerCase().contains(query)).toList();
          return filteredBranch.isNotEmpty
              ? filteredBranch.map((card) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListTile(
                    onTap: () {
                      controller.closeView(card.recipe.title);
                      controller.clear();
                      FocusScope.of(context).unfocus();
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => RecipeDetail(recipe: card.recipe),
                        ),
                      );
                    },
                    title: Text(card.recipe.title),
                  ),
                );
              }).toList()
              : [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Center(child: Text("No results found")),
                ),
              ];
        },
        onSubmitted: (val) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}

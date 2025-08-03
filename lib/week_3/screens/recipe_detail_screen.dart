import 'package:flutter/material.dart';
import 'package:personal_profile/week_3/data/sample_recipes.dart';
import 'package:personal_profile/week_3/utils/app_colors.dart';
import 'package:personal_profile/week_3/utils/responsive_breakpoints.dart';
import 'package:personal_profile/week_3/utils/typography.dart';

import '../widgets/recipe/recipe_card.dart';
import 'home_screen.dart';

class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({super.key});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool toggle = false;

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

  String? _selectedCategory;

  List<ResponsiveRecipeCard> get _filteredRecipes {
    if (_selectedCategory == null) return _recipes;
    return _recipes.where((card) {
      return card.recipe.category.toLowerCase().contains(_selectedCategory!.toLowerCase());
    }).toList();
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: argument != null && argument.isNotEmpty ? true : false,
        title: Text('Recipes'),
        centerTitle: false,
        actionsPadding: EdgeInsets.symmetric(horizontal: 10.0),
        actions: [
          FoodSearch(recipes: _recipes),
          GestureDetector(
            onTap: () {
              setState(() {
                toggle = !toggle;
              });
            },
            child: Icon(toggle ? Icons.grid_on : Icons.view_list_rounded),
          ),
        ],
      ),
      body: toggle ? _buildListView(context) : _buildGridView(context),

      // _buildListView(),
    );
  }

  _buildGridView(BuildContext context) {
    return Column(
      children: [
        _categoryFilter(),
        Expanded(
          child: _filteredRecipes.isEmpty
              ? GridView.builder(
            shrinkWrap: true,
            itemCount: SampleRecipes().allRecipe.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  ResponsiveBreakpoints.isMobile(context)
                      ? 1
                      : ResponsiveBreakpoints.isTablet(context)
                      ? 3
                      : 4,
            ),
            itemBuilder: (context, index) {
              final recipe = SampleRecipes().allRecipe[index].recipe;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => RecipeDetail(recipe: recipe),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                      Text(recipe.title, style: AppTextStyles.heading2),
                      Text(
                        '${recipe.prepTimeMinutes + recipe.cookTimeMinutes} minutes',
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ),
              );
            },
          ) : GridView.builder(
            shrinkWrap: true,
            itemCount: _filteredRecipes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
              ResponsiveBreakpoints.isMobile(context)
                  ? 1
                  : ResponsiveBreakpoints.isTablet(context)
                  ? 3
                  : 4,
            ),
            itemBuilder: (context, index) {
              final recipe = _filteredRecipes[index].recipe;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => RecipeDetail(recipe: recipe),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                      Text(recipe.title),
                      Text(
                        '${recipe.prepTimeMinutes + recipe.cookTimeMinutes} minutes',
                        // style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _buildListView(context) {
    return Column(
      children: [
        _categoryFilter(),
        Expanded(
          child:
              _filteredRecipes.isEmpty
                  ? ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: SampleRecipes().allRecipe.length,
                    itemBuilder: (context, index) {
                      final recipe = SampleRecipes().allRecipe[index].recipe;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                        child: ListTile(
                          tileColor: AppColors.secondary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          leading: Container(
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
                          title: Text(recipe.title, style: AppTextStyles.heading2),
                          subtitle: Text(
                            '${recipe.prepTimeMinutes + recipe.cookTimeMinutes} minutes',
                            style: AppTextStyles.body,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => RecipeDetail(recipe: recipe),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )
                  : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _filteredRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = _filteredRecipes[index].recipe;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                        child: ListTile(
                          tileColor: AppColors.secondary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          leading: Container(
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
                          title: Text(recipe.title, style: AppTextStyles.heading2),
                          subtitle: Text(
                            '${recipe.prepTimeMinutes + recipe.cookTimeMinutes} minutes',
                            style: AppTextStyles.body,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => RecipeDetail(recipe: recipe),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
        ),
      ],
    );
  }

  _categoryFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: 10,
              children: [
                _buildCategoryButton('Appetizer'),
                _buildCategoryButton('Main Dish'),
                _buildCategoryButton('Side Dish'),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            tooltip: 'Clear Filter',
            onPressed: () {
              setState(() => _selectedCategory = null);
            },
          ),
        ],
      ),
    );
  }

  _buildCategoryButton(String category) {
    final isSelected = _selectedCategory == category;
    return
      ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? AppColors.primary : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
      ),
      onPressed: () => _selectCategory(category),
      child: Text(category),
    );
  }
}

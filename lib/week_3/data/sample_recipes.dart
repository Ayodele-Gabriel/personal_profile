import 'package:flutter/material.dart';
import 'package:personal_profile/week_3/utils/app_colors.dart';
import 'package:personal_profile/week_3/utils/favorites_manager.dart';
import 'package:personal_profile/week_3/utils/typography.dart';

import '../models/nutrition_info.dart';
import '../models/recipe.dart';
import '../utils/app_assets.dart';
import '../widgets/recipe/ingredient_list.dart';
import '../widgets/recipe/instruction_step.dart';
import '../widgets/recipe/recipe_card.dart';

class SampleRecipes {
  List<ResponsiveRecipeCard> featuredRecipe = [
    ResponsiveRecipeCard(
      recipe: Recipe(
        id: '#01',
        title: 'Lobster',
        description: 'A delicately boiled whole lobster served simply with butter and lemon.',
        imageUrl: AppAssets.lobster,
        cookTimeMinutes: 15,
        prepTimeMinutes: 5,
        servings: 1,
        difficulty: 'Medium',
        ingredients: lobsterIngredient,
        instructions: lobsterStep,
        nutritionInfo: NutritionInfo(
          calories: 2,
          protein: 12.0,
          carbs: 15.0,
          fat: 11.0,
          fiber: 0.0,
          sugar: 0.0,
          sodium: 18.0,
        ),
        category: 'Appetizer',
        createdAt: DateTime.now(),
      ),
    ),

    ResponsiveRecipeCard(
      recipe: Recipe(
        id: '#02',
        title: 'Sushi',
        description:
            'A handcrafted sushi roll with vinegared rice, fresh fish, and crisp vegetables.',
        imageUrl: AppAssets.sushi,
        cookTimeMinutes: 15,
        prepTimeMinutes: 30,
        servings: 1,
        difficulty: 'Hard',
        ingredients: sushiIngredient,
        instructions: sushiStep,
        nutritionInfo: NutritionInfo(
          calories: 300,
          protein: 14.0,
          carbs: 42.0,
          fat: 9.0,
          fiber: 2.0,
          sugar: 5.0,
          sodium: 758.0,
        ),
        category: 'Main Dish',
        createdAt: DateTime.now(),
      ),
    ),

    ResponsiveRecipeCard(
      recipe: Recipe(
        id: '#04',
        title: 'Gizdodo',
        description: 'A bold Nigerian stir-fry of spicy gizzards and sweet fried plantains.',
        imageUrl: AppAssets.gizDodo,
        cookTimeMinutes: 45,
        prepTimeMinutes: 15,
        servings: 1,
        difficulty: 'Medium',
        ingredients: gizDodoIngredient,
        instructions: gizDodoStep,
        nutritionInfo: NutritionInfo(
          calories: 450,
          protein: 22.0,
          carbs: 42.0,
          fat: 24.0,
          fiber: 4.0,
          sugar: 12.0,
          sodium: 650.0,
        ),
        category: 'Side Dish',
        createdAt: DateTime.now(),
      ),
    ),
  ];

  List<ResponsiveRecipeCard> allRecipe = [
    ResponsiveRecipeCard(
      recipe: Recipe(
        id: '#01',
        title: 'Lobster',
        description: 'A delicately boiled whole lobster served simply with butter and lemon.',
        imageUrl: AppAssets.lobster,
        cookTimeMinutes: 15,
        prepTimeMinutes: 5,
        servings: 1,
        difficulty: 'Medium',
        ingredients: lobsterIngredient,
        instructions: lobsterStep,
        nutritionInfo: NutritionInfo(
          calories: 2,
          protein: 12.0,
          carbs: 15.0,
          fat: 11.0,
          fiber: 0.0,
          sugar: 0.0,
          sodium: 18.0,
        ),
        category: 'Appetizer',
        createdAt: DateTime.now(),
      ),
    ),

    ResponsiveRecipeCard(
      recipe: Recipe(
        id: '#02',
        title: 'Sushi',
        description:
            'A handcrafted sushi roll with vinegared rice, fresh fish, and crisp vegetables.',
        imageUrl: AppAssets.sushi,
        cookTimeMinutes: 15,
        prepTimeMinutes: 30,
        servings: 1,
        difficulty: 'Hard',
        ingredients: sushiIngredient,
        instructions: sushiStep,
        nutritionInfo: NutritionInfo(
          calories: 300,
          protein: 14.0,
          carbs: 42.0,
          fat: 9.0,
          fiber: 2.0,
          sugar: 5.0,
          sodium: 758.0,
        ),
        category: 'Main Dish',
        createdAt: DateTime.now(),
      ),
    ),

    ResponsiveRecipeCard(
      recipe: Recipe(
        id: '#03',
        title: 'Caviar',
        description: 'Luxurious salted fish roe delicately served on toast or blinis with cream.',
        imageUrl: AppAssets.caviar,
        cookTimeMinutes: 0,
        prepTimeMinutes: 2,
        servings: 1,
        difficulty: 'Easy',
        ingredients: caviarIngredient,
        instructions: caviarStep,
        nutritionInfo: NutritionInfo(
          calories: 42,
          protein: 4.0,
          carbs: 0.6,
          fat: 2.9,
          fiber: 0.0,
          sugar: 0.0,
          sodium: 240.0,
        ),
        category: 'Appetizer',
        createdAt: DateTime.now(),
      ),
    ),

    ResponsiveRecipeCard(
      recipe: Recipe(
        id: '#04',
        title: 'Gizdodo',
        description: 'A bold Nigerian stir-fry of spicy gizzards and sweet fried plantains.',
        imageUrl: AppAssets.gizDodo,
        cookTimeMinutes: 45,
        prepTimeMinutes: 15,
        servings: 1,
        difficulty: 'Medium',
        ingredients: gizDodoIngredient,
        instructions: gizDodoStep,
        nutritionInfo: NutritionInfo(
          calories: 450,
          protein: 22.0,
          carbs: 42.0,
          fat: 24.0,
          fiber: 4.0,
          sugar: 12.0,
          sodium: 650.0,
        ),
        category: 'Side Dish',
        createdAt: DateTime.now(),
      ),
    ),

    ResponsiveRecipeCard(
      recipe: Recipe(
        id: '#05',
        title: 'Jollof Rice',
        description: 'Iconic West African rice simmered in a rich tomato and pepper sauce.',
        imageUrl: AppAssets.jollofRice,
        cookTimeMinutes: 40,
        prepTimeMinutes: 20,
        servings: 1,
        difficulty: 'Medium',
        ingredients: jollofIngredient,
        instructions: jollofstep,
        nutritionInfo: NutritionInfo(
          calories: 380,
          protein: 7.0,
          carbs: 50.0,
          fat: 12.0,
          fiber: 3.0,
          sugar: 5.0,
          sodium: 750.0,
        ),
        category: 'Main Dish',
        createdAt: DateTime.now(),
      ),
    ),

    ResponsiveRecipeCard(
      recipe: Recipe(
        id: '#06',
        title: 'Lamb Chops',
        description: 'Juicy, herb-marinated lamb chops seared to tender perfection.',
        imageUrl: AppAssets.lambChops,
        cookTimeMinutes: 12,
        prepTimeMinutes: 10,
        servings: 1,
        difficulty: 'Easy',
        ingredients: lambIngredient,
        instructions: lambStep,
        nutritionInfo: NutritionInfo(
          calories: 280,
          protein: 23.0,
          carbs: 0.0,
          fat: 22.0,
          fiber: 0.0,
          sugar: 0.0,
          sodium: 75.0,
        ),
        category: 'Appetizer',
        createdAt: DateTime.now(),
      ),
    ),
  ];
}

class RecipeDetail extends StatefulWidget {
  const RecipeDetail({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {

  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = FavoriteManager().isFavorite(widget.recipe.id);
  }

  void _toggleFavorite() async {
    await FavoriteManager().toggleFavorite(widget.recipe.id);
    setState(() {
      isFavorite = FavoriteManager().isFavorite(widget.recipe.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(widget.recipe.title, style: AppTextStyles.heading1),
        centerTitle: true,
        actions: [
          _buildFavoriteButton(),
        ],
        actionsPadding: EdgeInsets.symmetric(horizontal: 10.0),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(tag: 'food',child: Image.asset(widget.recipe.imageUrl, fit: BoxFit.contain,)),
                ),
              Text('Ingredients', style: AppTextStyles.heading2),
              ...List.generate(widget.recipe.ingredients.length, (index) {
                final title = widget.recipe.ingredients[index].name;
                final amount = widget.recipe.ingredients[index].amount;
                final subtitle = widget.recipe.ingredients[index].unit;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    title: Text(title, style: AppTextStyles.body),
                    trailing: (Text(
                      '$amount $subtitle',
                      style: AppTextStyles.caption.copyWith(color: AppColors.surface),
                    )),
                    tileColor: AppColors.secondary,
                  ),
                );
              }),
              Text('Instructions', style: AppTextStyles.heading2),
              ...List.generate(widget.recipe.instructions.length, (index) {
                final title = widget.recipe.instructions[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    title: Text(title, style: AppTextStyles.body),
                    tileColor: AppColors.secondary,
                  ),
                );
              }),
              Text('Nutrition Facts', style: AppTextStyles.heading2),
              NutritionTile(title: 'Calories', recipe: '${widget.recipe.nutritionInfo.calories}'),
              NutritionTile(title: 'Protein', recipe: '${widget.recipe.nutritionInfo.protein}'),
              NutritionTile(title: 'Carbs', recipe: '${widget.recipe.nutritionInfo.carbs}'),
              NutritionTile(title: 'Fat', recipe: '${widget.recipe.nutritionInfo.fat}'),
              NutritionTile(title: 'Fiber', recipe: '${widget.recipe.nutritionInfo.fiber}'),
              NutritionTile(title: 'Sugar', recipe: '${widget.recipe.nutritionInfo.sugar}'),
              NutritionTile(title: 'Sodium', recipe: '${widget.recipe.nutritionInfo.sodium}'),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildFavoriteButton() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white.withAlpha((0.9 * 255).toInt()),
      shape: BoxShape.circle,
    ),
    child: IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey[600],
      ),
      onPressed: (){
        _toggleFavorite();
      },
      constraints: BoxConstraints(minWidth: 40, minHeight: 40),
    ),
  );
}
}

class NutritionTile extends StatelessWidget {
  const NutritionTile({super.key, required this.title, required this.recipe});

  final String title;
  final String recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTextStyles.body),
            Text(recipe, style: AppTextStyles.body),
          ],
        ),
        tileColor: AppColors.secondary,
      ),
    );
  }
}

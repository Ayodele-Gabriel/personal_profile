import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:personal_profile/week_3/widgets/recipe/recipe_card.dart';


class ResponsiveRecipeGrid extends StatelessWidget {
  const ResponsiveRecipeGrid({super.key, this.recipes, this.maxItems});

  final List<ResponsiveRecipeCard>? recipes;
  final int? maxItems;

  static const double mobile = 600;
  static const double tablet = 1200;

  static bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < mobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= mobile && MediaQuery.sizeOf(context).width < tablet;

  static bool isDesktop(BuildContext context) => MediaQuery.sizeOf(context).width >= tablet;

  static int getColumns(
    BuildContext context, {
    int mobileColumns = 1,
    int tabletColumns = 2,
    int desktopColumns = 3,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < mobile) return mobileColumns;
    if (width < tablet) return tabletColumns;
    return desktopColumns;
  }

  @override
  Widget build(BuildContext context) {
    if (recipes == null || recipes!.isEmpty) {
      return const Center(child: Text('No recipes available.'));
    }

    // Limit the recipes list based on maxItems
    final displayedRecipes =
        (maxItems != null && maxItems! < recipes!.length)
            ? recipes!.sublist(0, maxItems!)
            : recipes!;

    return CarouselSlider(
      items:
          displayedRecipes.map((recipeCard) {
            return Padding(padding: const EdgeInsets.symmetric(horizontal: 6.0), child: recipeCard);
          }).toList(),
      options: CarouselOptions(
        enableInfiniteScroll: false,
        padEnds: false,
        autoPlay: false,
        aspectRatio: isMobile(context) ? 12/8 : isTablet(context) ? 13/8 : 20/8,
        viewportFraction: 0.72,
      ),
    );
  }
}

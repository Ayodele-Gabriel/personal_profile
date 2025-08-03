import 'package:flutter/material.dart';
import 'package:personal_profile/week_3/data/sample_recipes.dart';
import 'package:personal_profile/week_3/screens/favorites_screen.dart';
import 'package:personal_profile/week_3/screens/home_screen.dart';
import 'package:personal_profile/week_3/screens/profile_screen.dart';
import 'package:personal_profile/week_3/screens/recipe_detail_screen.dart';
import 'package:personal_profile/week_3/utils/routing/route_paths.dart';
import 'package:personal_profile/week_3/widgets/common/responsive_navigation.dart';
import '../../screens/shopping_list_screen.dart';

PageRouteBuilder createRoute({RouteSettings? settings, required Widget child}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

/// A utility class that manages app routing.
class Routing {
  /// Creates and returns a [MaterialPageRoute] for navigation.
  ///
  /// - `settings`: Route settings containing the name and arguments.
  /// - `viewToShow`: The widget that should be displayed for the given route.
  static PageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget viewToShow,
  }) {
    // return MaterialPageRoute(
    //     builder: (context) => viewToShow, settings: settings);

    return createRoute(
      settings: settings,
      child: viewToShow,
    );
  }

  /// Generates and returns a route based on the given [RouteSettings].
  ///
  /// - Uses a `switch` statement to match route names and return the appropriate view.
  /// - If the route name does not match any predefined routes, returns a default empty `Scaffold`.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    /// Helper function to extract and cast route arguments safely.
    // T? extractArguments<T>(RouteSettings settings) {
    //   return settings.arguments as T?;
    // }

    // Extract arguments from route settings if needed.
    // var routeArgs = extractArguments(settings);

    switch (settings.name) {

      case RoutePaths.responsiveNavigation:
        return _getPageRoute(settings: settings, viewToShow: const ResponsiveNavigation());

      case RoutePaths.homeScreen:
        return _getPageRoute(settings: settings, viewToShow: const HomeScreen());

      case RoutePaths.favoritesScreen:
        return _getPageRoute(settings: settings, viewToShow: FavoritesScreen(allRecipes: SampleRecipes().allRecipe));

      case RoutePaths.profileScreen:
        return _getPageRoute(settings: settings, viewToShow: const ProfileScreen());

      case RoutePaths.shoppingListScreen:
        return _getPageRoute(settings: settings, viewToShow: const ShoppingListScreen());

      case RoutePaths.recipeDetailScreen:
        return _getPageRoute(settings: settings, viewToShow: const RecipeDetailScreen());

      default:
        return _getPageRoute(settings: settings, viewToShow: const ResponsiveNavigation());
    }
  }
}


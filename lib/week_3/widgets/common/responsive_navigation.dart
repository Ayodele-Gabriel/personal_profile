import 'package:flutter/material.dart';
import 'package:personal_profile/week_3/data/sample_recipes.dart';
import 'package:personal_profile/week_3/screens/recipe_detail_screen.dart';

import '../../screens/favorites_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/profile_screen.dart';
import '../../utils/responsive_breakpoints.dart';

class ResponsiveNavigation extends StatefulWidget {
  const ResponsiveNavigation({super.key});

  @override
  State<ResponsiveNavigation> createState() => _ResponsiveNavigationState();
}

class _ResponsiveNavigationState extends State<ResponsiveNavigation> {
  int selectedIndex = 0;

  final List<AppNavigationDestination> destinations = [
    AppNavigationDestination(
      label: 'Home',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      page: HomeScreen(),
    ),
    AppNavigationDestination(
      label: 'Recipes',
      icon: Icons.restaurant_outlined,
      selectedIcon: Icons.restaurant,
      page: RecipeDetailScreen(),
    ),
    AppNavigationDestination(
      label: 'Favorites',
      icon: Icons.favorite_outline,
      selectedIcon: Icons.favorite,
      page: FavoritesScreen(allRecipes: SampleRecipes().allRecipe,),
    ),
    AppNavigationDestination(
      label: 'Profile',
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      page: ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.isDesktop(context)) {
      return _buildDesktopLayout();
    } else if (ResponsiveBreakpoints.isTablet(context)) {
      return _buildTabletLayout();
    } else {
      return _buildMobileLayout();
    }
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: true,
            selectedIndex: selectedIndex,
            onDestinationSelected: _onDestinationSelected,
            destinations: destinations.map(_buildRailDestination).toList(),
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: destinations[selectedIndex].page),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: _onDestinationSelected,
            destinations: destinations.map(_buildRailDestination).toList(),
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: destinations[selectedIndex].page),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      body: destinations[selectedIndex].page,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: destinations.map(_buildBottomDestination).toList(),
      ),
    );
  }

  NavigationRailDestination _buildRailDestination(AppNavigationDestination dest) {
    return NavigationRailDestination(
      icon: Icon(dest.icon),
      selectedIcon: Icon(dest.selectedIcon),
      label: Text(dest.label),
    );
  }

  NavigationDestination _buildBottomDestination(AppNavigationDestination dest) {
    return NavigationDestination(
      icon: Icon(dest.icon),
      selectedIcon: Icon(dest.selectedIcon),
      label: dest.label,
      // page: dest.page,
    );
  }

  void _onDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}


class AppNavigationDestination {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Widget page;

  const AppNavigationDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.page,
  });
}

import 'package:flutter/material.dart';
import 'package:personal_profile/week_3/utils/favorites_manager.dart';
import 'package:personal_profile/week_3/utils/routing/route_generator.dart';
import 'package:personal_profile/week_3/utils/routing/route_observer.dart';
import 'package:personal_profile/week_3/utils/routing/route_paths.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavoriteManager().loadFavorites();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book',
      initialRoute: RoutePaths.responsiveNavigation,
      onGenerateRoute: Routing.generateRoute,
      navigatorObservers: [routeObserver],
    );
  }
}

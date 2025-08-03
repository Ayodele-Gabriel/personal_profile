import 'package:flutter/material.dart';


/// A custom [RouteObserver] to track route changes in the app.
class RouteObserverService extends RouteObserver<PageRoute<dynamic>> {
  /// Stores the name of the current active route.
  String? currentRoute;
  String? previousRouteName;

  /// Called when a new route is pushed onto the navigation stack.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute) {
      previousRouteName = currentRoute;
      currentRoute = route.settings.name; // Update the current route
    }
    super.didPush(route, previousRoute);
  }

  /// Called when a route is popped from the navigation stack.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute is PageRoute) {
      currentRoute = previousRoute.settings.name; // Update to the previous route
    }
    super.didPop(route, previousRoute);
  }

  /// Called when a route is replaced (e.g., using Navigator.pushReplacement).
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (newRoute is PageRoute) {
      previousRouteName = currentRoute;
      currentRoute = newRoute.settings.name; // Update the current route
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  /// Called when a route is removed from the navigation stack.
  @override
  void didRemove(Route route, Route? previousRoute) {
    if (previousRoute is PageRoute) {
      currentRoute = previousRoute.settings.name; // Update to the previous route
    }
    super.didRemove(route, previousRoute);
  }
}

/// A global instance of [RouteObserverService] to be used throughout the app.
final RouteObserverService routeObserver = RouteObserverService();

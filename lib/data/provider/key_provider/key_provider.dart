import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyProvider {
  static final KeyProvider _keyProvider = KeyProvider._internal();

  KeyProvider._internal();

  static KeyProvider get instance => _keyProvider;

  static final GlobalKey<DayViewState> calendarInstance = GlobalKey<DayViewState>();
}

class NavigatorKey {
  static final NavigatorKey _navigatorKey = NavigatorKey._internal();

  static NavigatorKey get instance => _navigatorKey;

  NavigatorKey._internal();

  final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navigator');
  final dropDownKey = GlobalKey(debugLabel: 'dropDown');

  GlobalKey<ScaffoldState>? _drawerKey;
  Key? _pageKey;

  set setDrawerKey(GlobalKey<ScaffoldState> key) {
    _drawerKey = key;
  }

  GlobalKey<ScaffoldState>? get getDrawerKey => _drawerKey;

  set setPageKey(Key key) {
    _pageKey = UniqueKey();
  }

  final calendarKey = GlobalKey<DayViewState>();

  Key? get getPageKey => _pageKey;

  dynamic routeToNamed(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  dynamic routeToNamedReplacement(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(route, arguments: arguments);
  }

  dynamic routeToPushNamedAndRemoveUntil(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
  }

  dynamic goBack({Map<String, dynamic>? arguments}) {
    return navigatorKey.currentState?.pop(arguments);
  }
}

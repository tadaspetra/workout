import 'package:test/home/home_view.dart';
import 'package:test/core/utils/navigation/route_data.dart';
import 'package:test/not_found/not_found_view.dart';

final routes = [
  RouteEntry(path: '/', builder: (key, routeData) => const HomeView()),
  RouteEntry(path: '/404', builder: (key, routeData) => const NotFoundView()),
];

import 'package:flutter/material.dart';
import 'package:test/core/utils/navigation/url_strategy/url_strategy.dart';
import 'package:test/startup/startup_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureUrlStrategy();
  runApp(const StartupView());
}

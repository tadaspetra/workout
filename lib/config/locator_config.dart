import 'package:flutter/foundation.dart';
import 'package:test/core/utils/http/http_abstraction.dart';
import 'package:test/core/utils/http/http_interceptor.dart';
import 'package:test/config/route_config.dart';
import 'package:test/core/utils/toast/toast_service.dart';
import 'package:test/core/utils/locator.dart';
import 'package:test/core/utils/navigation/router_service.dart';

final modules = [
  Module<RouterService>(
    builder: () => RouterService(supportedRoutes: routes),
    lazy: false,
  ),
  Module<ToastService>(builder: () => ToastService(), lazy: true),
  Module<HttpAbstraction>(
    builder:
        () => HttpAbstraction(
          interceptors: [
            LoggingInterceptor(
              logBody: !kReleaseMode, // Only log bodies in debug mode
            ),
          ],
        ),
    lazy: true,
  ),
];

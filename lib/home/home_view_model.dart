import 'package:flutter/foundation.dart';
import 'package:test/core/utils/toast/toast_service.dart';

class HomeViewModel {
  final ToastService _toastService;

  HomeViewModel({required ToastService toastService})
    : _toastService = toastService;

  final ValueNotifier<int> counter = ValueNotifier<int>(0);

  void increment() {
    counter.value++;

    if (counter.value % 10 == 0) {
      _toastService.show('Counter is now ${counter.value}');
    }
  }

  void dispose() {
    counter.dispose();
  }
}

import 'package:flutter/widgets.dart';

class FormStateController extends ChangeNotifier {
  final Map<String, TextEditingController> _controllers;
  late final VoidCallback _listener;

  FormStateController(Map<String, TextEditingController> controllers)
      : _controllers = controllers {
    _listener = _notify;
    for (final controller in _controllers.values) {
      controller.addListener(_listener);
    }
  }

  void _notify() => notifyListeners();

  Map<String, dynamic> get state {
    return {
      for (final entry in _controllers.entries) entry.key: entry.value.text,
    };
  }

  @override
  void dispose() {
    // Remove listeners to avoid memory leaks
    for (final controller in _controllers.values) {
      controller.removeListener(_listener);
    }
    super.dispose();
  }
}

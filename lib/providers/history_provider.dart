import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HistoryProvider extends ChangeNotifier {
  final Box _box = Hive.box('preferences');

  List<Map<String, dynamic>> _history = [];
  List<Map<String, dynamic>> get history => _history;

  HistoryProvider() {
    _loadHistory();
  }

  void _loadHistory() {
    final saved = _box.get('history');

    if (saved == null || saved is! List) {
      _history = [];
      return;
    }

    _history = [];

    for (var item in saved) {
      if (item is Map) {
        final map = Map<String, dynamic>.from(item);
        _history.add(map);
      }
    }
  }

  void addToHistory({
    required int productId,
    required String image,
  }) {
    final entry = {
      "id": productId,
      "image": image,
    };

    if (!_history.any((item) => item["id"] == productId)) {
      _history.insert(0, entry);
      _box.put('history', _history);
      notifyListeners();
    }
  }
}
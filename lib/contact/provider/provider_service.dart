// Source - https://stackoverflow.com/q
// Posted by Satyajyoti Biswas, modified by community. See post 'Timeline' for change history
// Retrieved 2025-12-16, License - CC BY-SA 4.0

import 'package:flutter/foundation.dart';

class ProviderService extends ChangeNotifier {
  final List<String> totalNames = [
    'Somesh',
    'Tarulata',
    'Indranil',
    'Satyajyoti',
    'Biswas',
    'Sajal',
    'Kumar',
    'Jhuma',
    'Mondal',
  ];

  List<String> _selectedNames = [];

  List<String> get selectedNames => List.unmodifiable(_selectedNames);

  void updateselectedNames(String name) {
    bool isExists = _selectedNames.contains(name);

    if (isExists)
      _selectedNames.remove(name);
    else
      _selectedNames.add(name);

    notifyListeners();
  }
}

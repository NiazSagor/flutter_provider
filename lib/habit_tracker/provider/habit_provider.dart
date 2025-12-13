import 'package:expense_tracker_provider/habit_tracker/model/habit.dart';
import 'package:flutter/material.dart';

class HabitProvider with ChangeNotifier {
  final List<Habit> _habits = [];

  List<Habit> get habits => List.unmodifiable(_habits);

  int get completedHabitCount =>
      _habits.where((habit) => habit.isCompleted).length;

  int get totalHabits => _habits.length;

  double get progress {
    if (totalHabits == 0) {
      return 0.0;
    }
    return (completedHabitCount / totalHabits) * 100;
  }

  void addHabit(Habit habit) {
    _habits.add(habit);
    notifyListeners();
  }

  void removeHabit(Habit habit) {
    _habits.remove(habit);
    notifyListeners();
  }

  void toggleHabit(Habit habit) {
    final index = _habits.indexOf(habit);
    if (index == -1) {
      return;
    }
    _habits[index].isCompleted = !_habits[index].isCompleted;
    notifyListeners();
  }

  void reset() {
    for (var habit in habits) {
      habit.isCompleted = false;
    }
    notifyListeners();
  }
}

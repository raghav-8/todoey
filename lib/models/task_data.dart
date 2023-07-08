import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:collection/collection.dart';
class TaskData extends ChangeNotifier{
  List<Task> _tasks=[
    Task(name: 'bring milk'),
  ];
  UnmodifiableListView get tasks{
    return UnmodifiableListView(_tasks);
  }
  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task=Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}
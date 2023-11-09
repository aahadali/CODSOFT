import 'package:flutter/material.dart';
import '../blueprints/add_blueprint.dart';

class ProviderList extends ChangeNotifier{
  final List<AddBP> newTasks = [];



  void addNewTask(String title, String description){
    final _newTask = AddBP(title: title, description: description);
    newTasks.add(_newTask);
    notifyListeners();
  }

  void deleteTask(AddBP delTask){
    newTasks.remove(delTask);
    notifyListeners();
  }

  void updateTask(AddBP editTask, String title, String desc){
    final index = newTasks.indexOf(editTask);
    newTasks.removeAt(index);
    final eTask = AddBP(title: title, description: desc);
    newTasks.insert(index, eTask);
    notifyListeners();
  }

  bool completed(bool isCompleteCheck){
    bool isCompleted = isCompleteCheck;
    notifyListeners();
    return isCompleted;
  }
  bool active(bool isActiveCheck){
    bool isActive = isActiveCheck;
    notifyListeners();
    return isActive;
  }





}
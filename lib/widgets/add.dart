import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_list.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _title = TextEditingController();
  final _desc = TextEditingController();

  late final String _newTitle;
  late final String _newDesc;

  @override
  void dispose() {
    _title.dispose();
    _desc.dispose();
    super.dispose();
  }

  void _addNewTask() {
    final title = _title.text.trim();
    final desc = _desc.text.trim();

    if (title.isEmpty || desc.isEmpty) {
      Navigator.pop(context);
      return;
    }
    _newTitle = title;
    _newDesc = desc;
    Provider.of<ProviderList>(context, listen: false)
        .addNewTask(_newTitle, _newDesc);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: 30,
            right: 30,
            left: 30,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Add Task',
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(fontSize: 28),
              ),
              controller: _title,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(fontSize: 28),
              ),
              controller: _desc,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _addNewTask,
                  child: const Text(
                    'Add Task',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blueprints/add_blueprint.dart';
import '../provider/provider_list.dart';

class DetailTask extends StatefulWidget {
  const DetailTask({
    super.key,
    required this.tasksList,
  });

  final AddBP tasksList;

  @override
  State<DetailTask> createState() => _DetailTaskState();
}

class _DetailTaskState extends State<DetailTask> {
  var _compSwitch = false;
  var _activeSwitch = false;
  var _isEdit = false;
  String _newTitle = '';
  String _newDesc = '';

  void _addUpdatedTask(AddBP tasks) {
    Provider.of<ProviderList>(context, listen: false)
        // .updateTask(_newTitle, _newDesc);
        .updateTask(tasks, _newTitle, _newDesc);
    Navigator.pop(context);
  }

  void switchUpdates(){
    final provider = Provider.of<ProviderList>(context, listen: false);
    // provider.isCompleted = _compSwitch;
    // provider.isActive = _activeSwitch;
    provider.completed(_compSwitch);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: _isEdit
            ? Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(fontSize: 28),
                      ),
                      initialValue: widget.tasksList.title,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter Valid Title';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _newTitle = value!;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(fontSize: 28),
                      ),
                      initialValue: widget.tasksList.description,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter Valid Description';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _newDesc = value!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isEdit = false;
                            });
                          },
                          icon: const Icon(Icons.cancel),
                          label: const Text('Cancel'),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            _addUpdatedTask(widget.tasksList);
                          },
                          icon: const Icon(Icons.update),
                          label: const Text('Update'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white
                      ),
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.cancel_outlined,
                      ),
                      label: const Text('Exit'),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Text(
                    widget.tasksList.title,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.tasksList.description,
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${widget.tasksList.date.hour.toString()}:${widget.tasksList.date.minute.toString()} ${widget.tasksList.date.timeZoneName}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Switch(
                        value: _compSwitch,
                        onChanged: (value) {
                          setState(() {
                            _compSwitch = value;
                            _activeSwitch = false;
                          });
                        },
                      ),
                      const Text(
                        'Completed',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Switch(
                        value: _activeSwitch,
                        onChanged: (value) {
                          setState(() {
                            _activeSwitch = value;
                            _compSwitch = false;
                          });
                        },
                      ),
                      const Text(
                        'Active',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isEdit = true;
                          });
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: switchUpdates,
                        icon: const Icon(Icons.security_update),
                        label: const Text('Update'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.cancel_outlined,
                    ),
                    label: const Text('Exit'),
                  ),
                ],
              ),
      ),
    );
  }
}

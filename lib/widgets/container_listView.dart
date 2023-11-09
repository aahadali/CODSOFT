import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/screens/detailTask.dart';
import 'package:to_do_list_app/widgets/task_container.dart';
import '../provider/provider_list.dart';

class ContainerListView extends StatelessWidget {
  const ContainerListView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderList>(context);
    return ListView.builder(
        itemCount: provider.newTasks.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => DetailTask(
                    tasksList: provider.newTasks[index],
                  ),
                ),
              );
            },
            child: Dismissible(

              onDismissed: (dismiss){
                provider.deleteTask(provider.newTasks[index]);
              },
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.delete_forever, color: Colors.red, size: 50,)
              ),
              key: UniqueKey(),
              child: TaskContainer(
                isCompleted: provider.hasListeners,
                title: provider.newTasks[index].title,
                description: provider.newTasks[index].description,
                date: provider.newTasks[index].date,
              ),
            ),
          );
        });
  }
}

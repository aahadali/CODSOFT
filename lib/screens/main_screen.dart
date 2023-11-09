import 'package:flutter/material.dart';
import 'package:to_do_list_app/provider/provider_list.dart';
import 'package:to_do_list_app/widgets/showAllTask.dart';
import 'package:to_do_list_app/widgets/add.dart';
import 'package:to_do_list_app/widgets/container_listView.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _addTask() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (ctx) => const AddTask(),
    );
  }

  void showAll() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (ctx) => const ShowAllTask(),
    );
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderList>(context).newTasks;
    final size = MediaQuery.sizeOf(context).height;

    final taskslengthcount = provider.length == 1 ? 'Task is pending' : 'Tasks are pending';
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addTask,
        label: const Text(
          'Add New Task',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 28,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello Aahad',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                '${provider.length} $taskslengthcount',
                style: const TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 20,
              ),
              const SearchBar(
                leading: Icon(Icons.search),
                hintText: 'Search Courses',
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Ongoing Task',
                style: TextStyle(fontSize: 19),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Today\'s Task',
                    style: TextStyle(fontSize: 19),
                  ),
                  TextButton(
                    onPressed: showAll,
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          fontSize: 19, color: Colors.deepOrangeAccent),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 220,
                width: double.infinity,
                child: const ContainerListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

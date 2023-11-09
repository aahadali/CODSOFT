import 'package:flutter/material.dart';
import 'package:to_do_list_app/widgets/container_listView.dart';

class ShowAllTask extends StatelessWidget {
  const ShowAllTask({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: ContainerListView(),
    );
  }
}

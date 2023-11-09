import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.isCompleted
      });

  final String title;
  final String description;
  final DateTime date;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // alignment: Alignment.bottomLeft,
            width: MediaQuery.sizeOf(context).width * 0.7,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isCompleted ? Colors.blue : Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Text('${date.hour.toString()}:${date.minute.toString()} ${date.timeZoneName}'),
        ],
      ),
    );
  }
}

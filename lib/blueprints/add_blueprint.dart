import 'package:uuid/uuid.dart';

final uuid = Uuid();

class AddBP {
  AddBP({required this.title, required this.description})
      : date = DateTime.now(),
        id = uuid.v4();

  final String title;
  final String description;
  final DateTime date;
  final String id;
}

import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  final String fName;

  @HiveField(1)
  final String lName;

  @HiveField(2)
  final int age;

  Student({required this.fName, required this.lName, required this.age});
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_details_hive/model/student.dart';
import 'package:student_details_hive/service/service.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final StudentService _studentService = StudentService();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Student>('students').listenable(),
        builder: (context, Box<Student> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text('No students added yet.'),
            );
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final student = box.getAt(index) as Student;

              return ListTile(
                title: Text('${student.fName} ${student.lName}'),
                subtitle: Text('Age: ${student.age}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showStudentDialog(context,
                            student: student, index: index);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _studentService.deleteStudent(index);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showStudentDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showStudentDialog(BuildContext context,
      {Student? student, int? index}) {
    if (student != null) {
      _fNameController.text = student.fName;
      _lNameController.text = student.lName;
      _ageController.text = student.age.toString();
    } else {
      _fNameController.clear();
      _lNameController.clear();
      _ageController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(student == null ? 'Add Student' : 'Edit Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _fNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final fName = _fNameController.text;
                final lName = _lNameController.text;
                final age = int.parse(_ageController.text);

                if (student == null) {
                  _studentService.addStudent(
                      Student(fName: fName, lName: lName, age: age));
                } else {
                  _studentService.updateStudent(
                      index!, Student(fName: fName, lName: lName, age: age));
                }

                Navigator.of(context).pop();
              },
              child: Text(student == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }
}

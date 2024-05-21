import 'package:flutter/material.dart';
import 'package:student_app/common/list_tile_widet.dart';
import 'package:student_app/common/my_button.dart';
import 'package:student_app/common/my_text_form_field.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({super.key});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  String? fname;
  String? lname;
  String? address;

  List<ListTileWidget> widgetsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment"),
        backgroundColor: Colors.red[500],
        centerTitle: true,
        elevation: 50,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                MyTextFormField(
                  onChanged: (value) {
                    setState(() {
                      fname = value;
                    });
                  },
                  text: 'First Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextFormField(
                  onChanged: (value) {
                    setState(() {
                      lname = value;
                    });
                  },
                  text: 'Last Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextFormField(
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                  text: 'Address',
                ),
                const SizedBox(
                  height: 8,
                ),
                MyButton(
                  onPressed: () {
                    setState(() {
                      widgetsList.add(
                        ListTileWidget(
                          fname: fname!,
                          lname: lname!,
                          address: address!,
                        ),
                      );
                    });
                  },
                  text: 'Submit',
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: ListView.builder(
                itemCount: widgetsList.length,
                itemBuilder: (context, index) {
                  return widgetsList[index];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
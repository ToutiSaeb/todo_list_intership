import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controller/crudcontroller.dart';
import 'package:todo_list/core/constant/routename.dart';

class Settings extends StatefulWidget {
  final Map<String, dynamic> note;
  final String category;

  const Settings({Key? key, required this.note, required this.category}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  CrudController controller = Get.put(CrudController());
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.note['title'] ?? '';
    bodyController.text = widget.note['body'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color.fromARGB(255, 172, 233, 3), width: 2.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Titre en haut du formulaire
                const Text(
                  'Update Your Note',
                  style: TextStyle(
                    color: Color.fromARGB(255, 172, 233, 3),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: titleController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Color.fromARGB(255, 172, 233, 3), width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Color.fromARGB(255, 172, 233, 3), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.white54, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: bodyController,
                  style: TextStyle(color: Colors.white),
                  maxLines: 6,
                  decoration: InputDecoration(
                    labelText: 'Body',
                    labelStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Color.fromARGB(255, 172, 233, 3), width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Color.fromARGB(255, 172, 233, 3), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.white54, width: 1.0),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                        elevation: 5,
                      ),
                      child: Text('Cancel', style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Map<String, dynamic> updatedNote = {
                          'title': titleController.text,
                          'body': bodyController.text,
                          'date': widget.note['date'] ?? DateTime.now().toString(),
                        };

                        await controller.updateNote(
                          widget.category,
                          widget.note['title'] ?? '',
                          updatedNote,
                        );

                        Get.offAllNamed(Routename.home);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 172, 233, 3),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                        elevation: 5,
                      ),
                      child: Text('Save', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

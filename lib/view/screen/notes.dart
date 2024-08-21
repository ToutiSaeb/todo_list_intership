import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controller/crudcontroller.dart';
import 'package:todo_list/core/constant/routename.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  CrudController controller = Get.put(CrudController());
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              Text(
                'Fill in Your Information',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 172, 233, 3),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                hint: const Text('Select a category', style: TextStyle(color: Colors.white54)),
                value: _selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
                items: <String>['#Work', '#Personal', '#Fitness', '#Books']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800],
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
              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> newNote = {
                    'title': titleController.text,
                    'body': bodyController.text,
                    'date': DateTime.now().toString(),
                  };

                  await controller.addNote(
                    _selectedValue ?? '#Personal',
                    newNote,
                  );

                  Get.offAllNamed(Routename.home);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 172, 233, 3),
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  elevation: 5,
                ),
                child: Text('Save Note', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

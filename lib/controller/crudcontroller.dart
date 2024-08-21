import 'dart:convert';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CrudController extends GetxController {
  List<Map<String, dynamic>>? notesList;

  Future<void> addNote(String category, Map<String, dynamic> note) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

  
    notesList = await getNotes(category);

  
    notesList!.add(note);


    String jsonString = jsonEncode(notesList);
    prefs.setString(category, jsonString);
  }

  Future<List<Map<String, dynamic>>> getNotes(String category) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(category);

    if (jsonString != null) {
 
      List<dynamic> jsonList = jsonDecode(jsonString);
      notesList = List<Map<String, dynamic>>.from(jsonList);
      return notesList!;
    }

  
    return [];
  }

  Future<void> deleteNote(String category, String noteId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(category);

    if (jsonString != null) {
      
      List<dynamic> jsonList = jsonDecode(jsonString);
  
      jsonList.removeWhere((note) => note['title'] == noteId);

      String updatedJsonString = jsonEncode(jsonList);
      await prefs.setString(category, updatedJsonString);
    }
  }

  Future<void> updateNote(String category, String oldTitle, Map<String, dynamic> updatedNote) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString(category);

  if (jsonString != null) {
    List<dynamic> jsonList = jsonDecode(jsonString);
 
    for (var note in jsonList) {
      if (note['title'] == oldTitle) {
        note['title'] = updatedNote['title'];
        note['body'] = updatedNote['body'];
        note['date'] = updatedNote['date'];
        break;
      }
    }
    String updatedJsonString = jsonEncode(jsonList);
    await prefs.setString(category, updatedJsonString);
  }
}

}

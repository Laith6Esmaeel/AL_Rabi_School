import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shcool/Controllers/Login-controller.dart';
import 'package:shcool/models/Note_model.dart';

class GetNote {
  Future<List<StudentNote>> getNote() async {
    try {
      String? token = await LoginController.getToken();
      int? userId = await LoginController.getUserId();
      
      print('User ID: $userId');
      print('Token: $token');

      final response = await http.get(
        Uri.parse('http://10.156.137.170:8000/api/my-notes'),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      print('--------------------------------------------');

      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        
        if (jsonData.isEmpty) {
          print('No notes found');
          return [];
        }
        
        List<StudentNote> notes = jsonData.map((item) => StudentNote.fromJson(item)).toList();
        
        print('Number of notes: ${notes.length}');
        for (var note in notes) {
          print('Note ID: ${note.id}, Type: ${note.type}, Teacher: ${note.teacherName}');
        }
        
        return notes;
      } else {
        throw Exception('Failed to fetch notes. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getNote: $e');
      throw Exception('Failed to fetch notes: $e');
    }
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Services/Get_Note.dart';
import 'package:shcool/models/Note_model.dart';

class NotesScreen extends StatelessWidget {
   NotesScreen({super.key});

  Color _getNoteColor(String type) {
    switch (type) {
      case 'تحذير':
        return Colors.orange;
      case 'متابعة':
        return Colors.blue;
      case 'إشادة':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getNoteIcon(String type) {
    switch (type) {
      case 'تحذير':
        return Icons.warning;
      case 'متابعة':
        return Icons.assignment;
      case 'إشادة':
        return Icons.star;
      default:
        return Icons.note;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff8CB0FF),
        title: Padding(
          padding:  EdgeInsets.only(left: 120),
          child: Text(
            '118'.tr,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffF2B6CC).withOpacity(0.1),
              Color(0xff8CB0FF).withOpacity(0.05),
            ],
          ),
        ),
        child: FutureBuilder<List<StudentNote>>(
          future: GetNote().getNote(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff6C8776)),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '119'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff8CB0FF),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 50,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'حدث خطأ في تحميل الملاحظات',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotesScreen(),
                          ),
                        );
                      },
                      child: Text('إعادة المحاولة'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff8CB0FF),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              List<StudentNote> notes = snapshot.data!;

              return Padding(
                padding: EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    StudentNote note = notes[index];
                    Color noteColor = _getNoteColor(note.type);

                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: noteColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  _getNoteIcon(note.type),
                                  color: noteColor,
                                  size: 24,
                                ),
                                SizedBox(width: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: noteColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: noteColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    note.type,
                                    style: TextStyle(
                                      color: noteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'المعلم: ${note.teacherName}',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              note.note,
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  note.createdAt,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.note_add,
                    color: Colors.grey,
                    size: 60,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '120'.tr,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '121'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

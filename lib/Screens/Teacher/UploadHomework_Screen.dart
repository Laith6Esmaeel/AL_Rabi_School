import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shcool/Controllers/Add_HomeWork.dart';

class UploadHomeworkPage extends StatefulWidget {
  const UploadHomeworkPage({super.key});

  @override
  State<UploadHomeworkPage> createState() => _UploadHomeworkPageState();
}

class _UploadHomeworkPageState extends State<UploadHomeworkPage> {
  List<File> _selectedImages = [];
  String? _selectedClass;
  String? _selectedSection;

  final List<String> _classes = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  final List<String> _sections = ["1", "2", "3", "4", "5", "6"];

  final Color primaryColor = const Color(0xff7A4012);

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _uploadHomework() async {
    if (_selectedClass == null ||
        _selectedSection == null ||
        _selectedImages.isEmpty) {
      Get.snackbar(
        'خطأ',
        'يرجى اختيار الصف والشعبة وصورة على الأقل',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    AddHomework.gradeController.text = _selectedClass!;
    AddHomework.sectionController.text = _selectedSection!;
    AddHomework.filePath.value = _selectedImages.first.path;

    try {
      await AddHomework.addHomework();

      setState(() {
        _selectedImages.clear();
        _selectedClass = null;
        _selectedSection = null;
      });
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xffE4DDC1),
        title: Text(
          '112'.tr,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedClass,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                labelText: '113'.tr,
              ),
              items: _classes
                  .map((c) => DropdownMenuItem(
                        value: c,
                        child: Text('الصف $c'),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedClass = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // اختيار الشعبة
            DropdownButtonFormField<String>(
              value: _selectedSection,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                labelText: '114'.tr,
              ),
              items: _sections
                  .map((s) => DropdownMenuItem(
                        value: s,
                        child: Text('الشعبة $s'),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedSection = value;
                });
              },
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff7A4012),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.camera_alt),
                  label:  Text('115'.tr),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff7A4012),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.photo),
                  label:  Text('116'.tr),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Obx(() => AddHomework.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _uploadHomework,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff7A4012),
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child:  Text('112'.tr),
                  )),
            const SizedBox(height: 16),

            if (_selectedImages.isNotEmpty)
              Text(
                'تم اختيار ${_selectedImages.length} صورة',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 16),

            Expanded(
              child: _selectedImages.isEmpty
                  ? Center(
                      child: Text(
                        '117'.tr,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: _selectedImages.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(
                                _selectedImages[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 15,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.close,
                                      size: 18, color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      _selectedImages.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

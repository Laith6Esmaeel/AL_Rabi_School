import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Services/Get_PDF.dart';
import 'package:shcool/models/Library_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfLibraryScreen extends StatelessWidget {
  const PdfLibraryScreen({super.key});

  Future<void> _openPdf(String pdfUrl) async {
    if (await canLaunchUrl(Uri.parse(pdfUrl))) {
      await launchUrl(Uri.parse(pdfUrl));
    } else {
      Get.snackbar(
        'خطأ',
        'تعذر فتح ملف PDF',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff8CB0FF),
        title: Padding(
          padding: const EdgeInsets.only(left: 120),
          child: Text(
            '19'.tr,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: FutureBuilder<List<HomeworkFile>>(
          future: GetPdf().getPDF(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xff8CB0FF),
                  ),
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
                      'حدث خطأ في تحميل الملفات',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfLibraryScreen(),
                          ),
                        );
                      },
                      child: Text('إعادة المحاولة'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6C8776),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              List<HomeworkFile> pdfFiles = snapshot.data!;

              return Padding(
                padding: EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: pdfFiles.length,
                  itemBuilder: (context, index) {
                    HomeworkFile pdfFile = pdfFiles[index];

                    return GestureDetector(
                      onTap: () => _openPdf(pdfFile.fileUrl),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                          border: Border.all(
                            color: Color(0xff8CB0FF).withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.picture_as_pdf,
                              color: Colors.red,
                              size: 50,
                            ),
                            SizedBox(height: 12),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'ملف ${pdfFile.id}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 8),

                            // زر التحميل
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => _openPdf(pdfFile.fileUrl),
                                child: Text(
                                  '122'.tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff8CB0FF),
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
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
                    Icons.folder_open,
                    color: const Color.fromARGB(255, 197, 115, 115),
                    size: 60,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '123'.tr,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '124'.tr,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
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

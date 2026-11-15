import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shcool/Services/Get_HomeWork.dart';
import 'package:shcool/models/HomeWork_model.dart';

class Homeworkscreen extends StatelessWidget {
  const Homeworkscreen({super.key});

  String _fixImageUrl(String originalUrl) {
    if (originalUrl.contains('127.0.0.1')) {
      return originalUrl.replaceAll(
          'http://127.0.0.1:8000', 'http://10.156.137.170:8000');
    }
    else if (originalUrl.contains('10.156.137.170')) {
      return originalUrl;
    }
    else {
      return originalUrl;
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
            '34'.tr,
            style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: FutureBuilder<List<GalleryModel>>(
          future: GetHomework().getHomework(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'حدث خطأ في تحميل الوظائف: ${snapshot.error}',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              );
            } else if (snapshot.hasData) {
              List<GalleryModel> homeworkList = snapshot.data!;

              if (homeworkList.isEmpty) {
                return Center(
                  child: Text(
                    '125'.tr,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: homeworkList.length,
                  itemBuilder: (context, index) {
                    GalleryModel homework = homeworkList[index];
                    String fixedImageUrl = _fixImageUrl(homework.filePath);

                    return Container(
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
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: Image.network(
                                fixedImageUrl,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  print('Error loading image: $error');
                                  print('URL: $fixedImageUrl');
                                  return Container(
                                    color: Colors.grey[200],
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_not_supported,
                                          color: Colors.grey[400],
                                          size: 40,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'تعذر تحميل الصورة',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'الواجب ${index + 1}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'تاريخ الإضافة: ${_formatDate(homework.createdAt)}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: Text(
                  'لا توجد بيانات',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shcool/Controllers/Login-controller.dart';

class NotificationService {
  static Future<void> initialize() async {
    int? userId = await LoginController.getUserId();

    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();
    print("🔔 حالة الإذن: ${settings.authorizationStatus}");

    String? token = await FirebaseMessaging.instance.getToken();
    print(
        "✅ FCM Token&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&: $token");
    if (token != null) {
      sendTokenToBackend(token, userId.toString());
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📲 إشعار أثناء الاستخدام: ${message.notification?.title}");

      if (message.notification != null) {
        Get.snackbar(
          message.notification!.title ?? "إشعار جديد",
          message.notification!.body ?? "",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("📲 المستخدم فتح التطبيق من الإشعار");

      if (message.notification != null) {
        Get.snackbar(
          "فتح من الإشعار",
          message.notification!.title ?? "",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
        );
      }
    });
  }

  static Future<void> sendTokenToBackend(String token, String userId) async {
    final url = Uri.parse("http://10.156.137.170:8000/api/save-fcm-token");

    final response = await http.post(
      url,
      body: {
        'user_id': userId.toString(),
        'fcm_token': token.toString(),
      },
    );

    if (response.statusCode == 200) {
      print("✅ FCM Token saved to backend");
    } else {
      print("❌ Failed to save token: ${response.body}");
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print("📩 إشعار بالخلفية: ${message.messageId}");
  }
}

import 'package:flutter_application_1/controllers/popular_product_controller.dart';
import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // Core
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://web.lunchbox.com.my"));
  // Get.lazyPut(() => ApiClient(appBaseUrl: "http://192.168.29.228:8000/stackfooddj"));
  // Repository
  Get.lazyPut(() => PopularProducrRepo(apiClient: Get.find()));
  // Controller
  Get.lazyPut(() => PopularProductController(popularProducrRepo: Get.find()));
}

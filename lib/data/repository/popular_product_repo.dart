import 'package:flutter_application_1/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProducrRepo extends GetxService {
  final ApiClient apiClient;

  PopularProducrRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData("/api/v1/products/popular");
  }
}

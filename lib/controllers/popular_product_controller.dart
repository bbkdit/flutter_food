// import 'dart:html';

import 'package:flutter_application_1/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../data/model/product_model.dart';

class PopularProductController extends GetxController {
  final PopularProducrRepo popularProducrRepo;

  PopularProductController({required this.popularProducrRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  Future<void> getPopularProductList() async {
    Response response = await popularProducrRepo.getPopularProductList();

    if (response.statusCode == 200) {
      print("got product data");
      _popularProductList = [];
      _popularProductList.addAll(ProductModel.fromJson(response.body).product);
      update();
    } else {
      print(response.statusText);
    }
  }
}

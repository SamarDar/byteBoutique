import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:focalx_task6/data/model/all_categories_model.dart'
    as AllCategories;
import 'package:focalx_task6/data/model/all_products_model.dart' as AllProducts;
import '../../../core/classes/crud.dart';
import '../../../core/classes/status_requests.dart';
import '../../../core/constant_data/link.dart';
import '../../../core/services/myServices.dart';

class HomeController extends GetxController {
  RxList<AllCategories.Datum> categories = <AllCategories.Datum>[].obs;
  RxList<AllProducts.Datum> products = <AllProducts.Datum>[].obs;
  TextEditingController searchController = TextEditingController();
  final Crud _crud = Get.find<Crud>();
  String allCategoriesUrl = AppLink.allCategories;
  String allProductsUrl = AppLink.allProducts;
  final MyServices myServices = Get.find<MyServices>();

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
    getAllProducts();
  }

  getAllCategories() async {
    try {
      Either<StatusRequest, Map<String, dynamic>> result = await _crud.getData(
          allCategoriesUrl,
          AppLink.getHeaderWithToken(myServices.getAccessToken()));
      result.fold(
        (failure) {
          if (failure == StatusRequest.serverFailure) {
            print("Failed to fetch data. Please try again later.");
          } else {
            print("An error occurred: $failure");
          }
        },
        (data) {
          if (data.containsKey("data")) {
            List<AllCategories.Datum> parsedData =
                List<AllCategories.Datum>.from(data["data"]
                    .map((item) => AllCategories.Datum.fromJson(item)));
            categories.assignAll(parsedData);
            print(categories);
            update();
          } else {
            print("Invalid data format received.");
          }
        },
      );
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  getAllProducts() async {
    try {
      Either<StatusRequest, Map<String, dynamic>> result = await _crud.getData(
          allProductsUrl,
          AppLink.getHeaderWithToken(myServices.getAccessToken()));
      result.fold(
        (failure) {
          if (failure == StatusRequest.serverFailure) {
            print("Failed to fetch data. Please try again later.");
          } else {
            print("An error occurred: $failure");
          }
        },
        (data) {
          if (data.containsKey("data")) {
            List<AllProducts.Datum> parsedData = List<AllProducts.Datum>.from(
                data["data"].map((item) => AllProducts.Datum.fromJson(item)));
            products.assignAll(parsedData);
            print(products);
            update();
          } else {
            print("Invalid data format received.");
          }
        },
      );
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}

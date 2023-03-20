import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;
import 'package:vegytably_merchant/api/menu_api.dart';

import '../models/exception_response.dart';
import '../models/menu_model.dart';

class MerchantMenuController extends GetxController {
  static MerchantMenuController to = Get.find();
  final _storage = const FlutterSecureStorage();

  RxList<Menu> menuList = <Menu>[].obs;
  final Rx<Menu> _selectedMenu = Menu(
    id: '',
    name: '',
    description: '',
    price: 0,
    imageId: '',
    imageUrl: '',
    merchantId: '',
  ).obs;

  Rx<bool> isLoading = false.obs;

  Menu get selectedMenu => _selectedMenu.value;

  @override
  void onInit() {
    super.onInit();
    fetchMenuList();
  }

  @override
  void onClose() {
    super.onClose();
    clearMenu();
  }

  void setSelectedMenu(Menu menu) {
    _selectedMenu.value = menu;
    update();
  }

  void setMenuList(List<Menu> menu) {
    menuList.value = menu;
    update();
  }

  void clearMenu() {
    _selectedMenu.value = Menu(
      id: '',
      name: '',
      description: '',
      price: 0,
      imageId: '',
      imageUrl: '',
      merchantId: '',
    );
    update();
  }

  void fetchMenuList() async {
    try {
      isLoading.value = true;
      update();

      String? refreshToken = await _storage.read(key: "refreshToken");

      if (refreshToken == null) {
        throw Exception("Refresh token is null");
      }

      Response response = await MenuApi.instance.fetchMenuList(refreshToken);
      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      List<Menu> menuList =
          Menu.fromJsonList(response.data["data"]["menuList"]);

      setMenuList(menuList);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> addMenu(
    TextEditingController nameController,
    TextEditingController descriptionController,
    TextEditingController priceController,
  ) async {
    try {
      isLoading.value = true;
      update();

      String? refreshToken = await _storage.read(key: "refreshToken");

      if (refreshToken == null) {
        throw Exception("Refresh token is null");
      }
      ;

      Map<String, dynamic> body = {
        "name": nameController.text,
        "price": double.tryParse(priceController.text.trim()) ?? 0,
        "description": descriptionController.text,
      };

      Response response = await MenuApi.instance.addMenu(refreshToken, body);

      if (response.statusCode != 201) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      print(response);

      Menu menu = Menu.fromJson(response.data["data"]["menu"]);
      menuList.add(menu);

      Get.back();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> updateMenu(
    TextEditingController nameController,
    TextEditingController descriptionController,
    TextEditingController priceController,
  ) async {
    try {
      isLoading.value = true;
      update();

      Map<String, dynamic> body = {
        "name": nameController.text,
        "price": double.tryParse(priceController.text.trim()) ?? 0,
        "description": descriptionController.text,
      };

      Response response =
          await MenuApi.instance.updateMenu(body, selectedMenu.id);

      if (response.statusCode != 200) {
        print(response);
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      // refetch menu list
      fetchMenuList();

      Get.back();
      Get.snackbar("Success!", "Updated menu successfully.");
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> deleteMenu() async {
    try {
      isLoading.value = true;
      update();

      ;

      Response response = await MenuApi.instance.deleteMenu(selectedMenu.id);

      if (response.statusCode != 200) {
        print(response);
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      // refetch menu list
      fetchMenuList();

      Get.back();
      Get.snackbar("Success!", "Deleted menu successfully.");
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }
}

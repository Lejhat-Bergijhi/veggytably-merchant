import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;
import 'package:image_picker/image_picker.dart';
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

  Rx<String> uploadedImageId = ''.obs;
  Rx<String> uploadedImageUrl = ''.obs;

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

  void setUploadedImage(String imageId, String imageUrl) {
    uploadedImageId.value = imageId;
    uploadedImageUrl.value = imageUrl;
    update();
  }

  void clearUploadedImage() {
    uploadedImageId.value = "";
    uploadedImageUrl.value = "";
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
        "imageId":
            uploadedImageId.value.isNotEmpty ? uploadedImageId.value : null,
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
      clearUploadedImage();
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
        "imageId":
            uploadedImageId.value.isNotEmpty ? uploadedImageId.value : null,
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
      clearUploadedImage();
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

  void uploadImage(ImageSource imageSource) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: imageSource,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 50,
      );
      isLoading(true);
      update();
      if (pickedFile != null) {
        var response = await MenuApi.instance.uploadMenuImage(pickedFile.path);

        if (response.statusCode == 200) {
          String imageId = response.data["data"]["imageId"];
          String imageUrl = response.data["data"]["imageUrl"];

          setUploadedImage(imageId, imageUrl);

          Get.snackbar('Success', 'Image uploaded successfully');
        } else {
          Get.snackbar('Failed', 'Error Code: ${response.statusCode}');
        }
      } else {
        Get.snackbar('Failed', 'Image not selected');
      }
    } finally {
      isLoading(false);
      update();
    }
  }
}

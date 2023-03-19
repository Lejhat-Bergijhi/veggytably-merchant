import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;

import '../api/merchant_api.dart';
import '../models/exception_response.dart';
import '../models/merchant.dart';
import '../views/login_page.dart';
import 'auth_controller.dart';

class MerchantController extends GetxController {
  final _storage = const FlutterSecureStorage();
  final Rx<Merchant> _merchant = Merchant(
          email: '',
          id: '',
          phone: '',
          rating: 0,
          restaurantAddress: '',
          restaurantName: '',
          username: '')
      .obs;

  Rx<bool> isLoading = false.obs;

  Merchant get merchant => _merchant.value;

  @override
  void onInit() {
    super.onInit();
    fetchMerchantProfile();
  }

  void setMerchant(Merchant merchant) {
    _merchant.value = merchant;
    update();
  }

  Future fetchMerchantProfile() async {
    try {
      isLoading.value = true;
      update();

      const storage = FlutterSecureStorage();
      String? refreshToken = await storage.read(key: "refreshToken");

      if (refreshToken == null) {
        throw Exception("Refresh token is null");
      }

      Response response =
          await MerchantApi.instance.fetchMerchant(refreshToken);
      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      Merchant merchant = Merchant.fromJson(response.data["data"]["merchant"]);
      setMerchant(merchant);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> updateProfile(
    TextEditingController usernameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController restaurantNameController,
    TextEditingController restaurantAddressController,
  ) async {
    try {
      isLoading.value = true;
      String? refreshToken = await _storage.read(key: "refreshToken");

      if (refreshToken == null) {
        throw Exception("Refresh token not found");
      }

      Map<String, String> body = {
        "username": usernameController.text,
        "email": emailController.text.trim(),
        "phone": phoneController.text,
        "restaurantName": restaurantNameController.text,
        "restaurantAddress": restaurantAddressController.text
      };

      Response response = await MerchantApi.instance.updateProfile(body);

      if (response.statusCode != 200) {
        if (response.statusCode == 401) {
          AuthController.to.clearUser();
          Get.offAll(() => const LoginPage(), transition: Transition.fade);
        }

        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      print(response);
      Merchant merchant = Merchant.fromJson(response.data["data"]["merchant"]);

      print(merchant);
      setMerchant(merchant);

      Get.snackbar("Success", "Update profile success!");
      // Get.offAll(
      //   () => LandingPage(initialIndex: 3),
      //   transition: Transition.fade,
      // );

      // setUser(user);
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:get/get.dart" hide Response;
import "package:vegytably_merchant/utils/api.endpoints.dart";
import "package:vegytably_merchant/views/login_page.dart";

import "../api/auth_api.dart";
import "../models/authentication_response.dart";
import "../models/exception_response.dart";
import "../views/home_page.dart";

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final _storage = const FlutterSecureStorage();

  @override
  onInit() {
    super.onInit();
    checkAuth();
  }

  Future<void> signUp(
    TextEditingController usernameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController passwordController,
    TextEditingController restaurantNameController,
    TextEditingController restaurantAddressController,
  ) async {
    try {
      Map<String, String> body = {
        "username": usernameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "phone": phoneController.text,
        "restaurantName": restaurantNameController.text,
        "restaurantAddress": restaurantAddressController.text,
      };

      Response response = await AuthApi.instance.postSignUp(body);
      // print(response.body.toString());
      if (response.statusCode != 201) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      AuthenticationResponse authenticationResponse =
          AuthenticationResponse.fromJson(response.data);

      print(authenticationResponse.data.toJson());
      // store refreshToken in secure storage
      await _storage.write(
          key: "refreshToken", value: authenticationResponse.data.refreshToken);

      Get.offAll(
        () => const HomePage(),
        transition: Transition.rightToLeft,
      );
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> login(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    try {
      var headers = {"Content-Type": "application/json"};
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login);

      Map<String, String> body = {
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "role": "MERCHANT",
      };

      Response response = await AuthApi.instance.postLogin(body);
      print(response.data.toString());

      if (response.statusCode != 200) {
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      AuthenticationResponse authenticationResponse =
          AuthenticationResponse.fromJson(response.data);

      print(authenticationResponse.data.toJson());
      // store refreshToken in secure storage
      await _storage.write(
          key: "refreshToken", value: authenticationResponse.data.refreshToken);

      Get.offAll(
        () => const HomePage(),
        transition: Transition.fade,
      );
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> logout() async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      if (refreshToken == null) {
        throw Exception("Refresh token not found");
      }

      Response response = await AuthApi.instance.postLogout(refreshToken);
      if (response.statusCode != 200) {
        // TODO: Create error handler based on status code
        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      await _storage.delete(key: "refreshToken");

      Get.offAll(
        () => const LoginPage(),
        transition: Transition.fade,
      );
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> checkAuth() async {
    try {
      const storage = FlutterSecureStorage();
      String? refreshToken = await storage.read(key: "refreshToken");

      // TODO verify token
      if (refreshToken != null) {
        Get.offAll(
          () => const HomePage(),
          transition: Transition.fade,
        );
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }
}

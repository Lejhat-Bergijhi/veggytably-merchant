import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:get/get.dart";
import "package:vegytably_merchant/utils/api.endpoints.dart";
import "package:http/http.dart" as http;
import "package:vegytably_merchant/views/login_page.dart";

import "../models/authentication_response.dart";
import "../models/exception_response.dart";
import "../views/home_page.dart";

class AuthController extends GetxController {
  final _storage = const FlutterSecureStorage();

  Future<void> signUp(
    TextEditingController usernameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController passwordController,
    TextEditingController restaurantNameController,
    TextEditingController restaurantAddressController,
  ) async {
    try {
      var headers = {"Content-Type": "application/json"};
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.signUp);

      Map<String, String> body = {
        "username": usernameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "phone": phoneController.text,
        "restaurantName": restaurantNameController.text,
        "restaurantAddress": restaurantAddressController.text,
      };

      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      print(response.body.toString());
      if (response.statusCode != 201) {
        String errorMessage =
            ExceptionResponse.getMessage(jsonDecode(response.body));
        throw Exception(errorMessage);
      }

      final json = jsonDecode(response.body);

      AuthenticationResponse authenticationResponse =
          AuthenticationResponse.fromJson(json);

      print(authenticationResponse.data.toJson());
      // store accessToken and refreshToken in secure storage
      await _storage.write(
          key: "accessToken", value: authenticationResponse.data.accessToken);
      await _storage.write(
          key: "refreshToken", value: authenticationResponse.data.refreshToken);

      Get.offAll(
        () => HomePage(),
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
        "password": passwordController.text
      };

      http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      print(response.body.toString());

      if (response.statusCode != 200) {
        String errorMessage =
            ExceptionResponse.getMessage(jsonDecode(response.body));
        throw Exception(errorMessage);
      }
      final json = jsonDecode(response.body);

      AuthenticationResponse authenticationResponse =
          AuthenticationResponse.fromJson(json);

      print(authenticationResponse.data.toJson());
      // store accessToken and refreshToken in secure storage
      await _storage.write(
          key: "accessToken", value: authenticationResponse.data.accessToken);
      await _storage.write(
          key: "refreshToken", value: authenticationResponse.data.refreshToken);

      Get.offAll(
        () => HomePage(),
        transition: Transition.rightToLeft,
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

      var headers = {
        "Content-Type": "application/json",
        "authorization": 'Bearer $refreshToken',
      };
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.logout);

      http.Response response = await http.post(
        url,
        headers: headers,
      );
      if (response.statusCode != 200) {
        // TODO create get exception message method
        String errorMessage =
            ExceptionResponse.getMessage(jsonDecode(response.body));
        throw Exception(errorMessage);
      }
      final json = jsonDecode(response.body);

      await _storage.delete(key: "refreshToken");
      await _storage.delete(key: "accessToken");

      Get.offAll(
        () => LoginPage(),
        transition: Transition.fade,
      );
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }
}

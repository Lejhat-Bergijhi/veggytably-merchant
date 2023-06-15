import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:get/get.dart" hide Response;
import "package:vegytably_merchant/views/landing_page.dart";
import "package:vegytably_merchant/views/login_page.dart";

import "../api/auth_api.dart";
import "../models/authentication_response.dart";
import "../models/exception_response.dart";
import "../models/user_model.dart";

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final _storage = const FlutterSecureStorage();

  final Rx<User> _user = User(
    id: "",
    username: "",
    email: "",
    phone: "",
    wallet: 0,
  ).obs;
  RxBool isLogin = false.obs;
  RxBool isLoading = false.obs;

  User get user => _user.value;

  @override
  void onReady() {
    super.onReady();
    // TODO uncomment code if ready to implement
    checkAuth();
    ever(isLogin, _initialScreen);
  }

  void _initialScreen(bool isLogin) {
    if (isLogin) {
      Get.offAll(
        () => LandingPage(),
        transition: Transition.rightToLeft,
      );
    } else {
      Get.offAll(
        () => const LoginPage(),
        transition: Transition.rightToLeft,
      );
    }
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
        () => LandingPage(),
        transition: Transition.fade,
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
        () => LandingPage(),
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
      String? refreshToken = await _storage.read(key: "refreshToken");

      // check expire time of refreshToken
      if (refreshToken == null) {
        clearUser();
        return;
      }
      // verify refreshToken
      Response response = await AuthApi.instance.postVerifyAuth();

      if (response.statusCode != 200) {
        if (response.statusCode == 401) {
          clearUser();
        }

        String errorMessage = ExceptionResponse.getMessage(response.data);
        throw Exception(errorMessage);
      }

      User user = User.fromJson(response.data["data"]["user"]);

      setUser(user);
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }

  void setUser(User u) {
    _user.value = u;
    isLogin.value = true;
    update();
  }

  void clearUser() {
    _user.value = User(
      id: "",
      username: "",
      email: "",
      phone: "",
      wallet: 0,
    );
    isLogin.value = false;
    update();
  }
}

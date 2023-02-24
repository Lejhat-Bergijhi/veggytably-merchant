import "dart:convert";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:vegytably_merchant/utils/api.endpoints.dart";
import "package:http/http.dart" as http;

class SignUpController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // TODO store to storage

  Future<void> signUp() async {
    try {
      var headers = {"Content-Type": "application/json"};
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.signUp);

      Map<String, String> body = {
        "username": usernameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text
      };

      http.Response response =
          await http.post(url, headers: headers, body: jsonEncode(body));

      print(response.body);
      if (response.statusCode != 201) {
        // TODO create exception handler
        throw Exception(response);
      }

      final json = jsonDecode(response.body);
      // TODO handle json file

      Get.back();
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }
}

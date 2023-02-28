import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:http/http.dart" as http;
import '../models/exception_response.dart';
import '../models/merchant_profile.dart';
import '../utils/api.endpoints.dart';

class MerchantApi {
  static Future<MerchantProfile> fetchMerchantProfile() async {
    const storage = FlutterSecureStorage();
    String? refreshToken = await storage.read(key: "refreshToken");

    if (refreshToken == null) {
      throw Exception("Refresh token is null");
    }

    var headers = {
      "Content-Type": "application/json",
      "authorization": 'Bearer $refreshToken',
    };
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.merchantEndpoints.getProfile);

    http.Response response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode != 200) {
      String errorMessage =
          ExceptionResponse.getMessage(jsonDecode(response.body));
      throw Exception(errorMessage);
    }

    final json = jsonDecode(response.body);
    print(json.toString());

    MerchantProfile merchantProfile = MerchantProfile.fromJson(json);
    return merchantProfile;
  }
}

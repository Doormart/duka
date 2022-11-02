import 'dart:convert';
import 'package:duka/core/app/app.locator.dart';
import 'package:duka/core/models/auth_model.dart';
import 'package:duka/core/models/dashboard_model.dart';
import 'package:duka/core/models/forgot_password_model.dart';
import 'package:duka/core/models/orders_models.dart';
import 'package:duka/core/services/http_service.dart';
import 'package:duka/core/utilities/storage_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';


enum OrdersType{
  all,
  completed,
  ongoing,
}

class NetworkService {

  final httpService = locator<HttpService>();
  static const baseUrl = "https://api.useduka.com/";
  final box = GetStorage();

  Map<String, String>  get defaultHeader {
   return {
     "Accept": "application/json",
     "Content-Type": "application/json",
   };
  }

  Map<String, String> get postAuthHeader {
    String accessToken = box.read(StorageKey.token);

    Map<String, String> authHeaders = {};
    authHeaders.addAll(defaultHeader);

    authHeaders['Authorization'] = 'Bearer $accessToken';
    return authHeaders;

  }

  Future<AuthResponse?> login(
      {required String phone, required String password}) async {
    var url = "${baseUrl}api/rider/login";

    Map<String, dynamic> payload = {
      "phone": phone,
      "password": password,
    };

    Response response = await httpService.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: defaultHeader,
    );

    return authResponseFromJson(response.body);
  }

  Future<ForgotPasswordResponse?> forgotPassword({required String phone}) async {
    var url = '${baseUrl}api/rider/password/forgot';

    Map<String, String> payload = {
      "phone": phone,
    };
    
    Response response = await httpService.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: defaultHeader,
    );
    
    return forgotPasswordResponseFromJson(response.body);
  }

  Future<AuthResponse?> checkOtp({required String otp}) async {
    var url = '${baseUrl}api/rider/password/otp';

    Map<String, dynamic> payload = {
      'otp': otp,
    };

    Response response = await httpService.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: defaultHeader,
    );

    return authResponseFromJson(response.body);
  }

  Future<AuthResponse?> resetPassword({required int id, required String phone, required password}) async {
    var url = '${baseUrl}api/rider/password/reset';

    Map<String, dynamic> payload = {
      'rider_id': id,
      'phone': phone,
      'password': password,
    };

    Response response = await httpService.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: defaultHeader,
    );

    return authResponseFromJson(response.body);
  }

  Future<DashboardModel?> getDashboard() async {
    var url = '${baseUrl}api/rider/dashboard';

    Response response = await httpService.get(
      Uri.parse(url),
      headers: postAuthHeader,
    );

    return dashboardModelFromJson(response.body);
  }

  Future<OrdersModel> getOrders(OrdersType type) async {
    String url;
    switch (type){
      case OrdersType.all:
        url = '${baseUrl}api/rider/orders/all';
        break;
      case OrdersType.completed:
        url = '${baseUrl}api/rider/orders/completed';
        break;
      case OrdersType.ongoing:
        url = '${baseUrl}api/rider/orders/';
        break;
      default:
        url = '${baseUrl}api/rider/orders/';
    }

    Response response = await httpService.get(
      Uri.parse(url),
      headers: postAuthHeader,
    );

    return ordersModelFromJson(response.body);
  }

}


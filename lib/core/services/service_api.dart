import 'package:duka/core/app/app.locator.dart';
import 'package:duka/core/models/auth_model.dart';
import 'package:duka/core/models/dashboard_model.dart';
import 'package:duka/core/models/forgot_password_model.dart';
import 'package:duka/core/models/orders_models.dart';
import 'package:duka/core/services/network_service.dart';

class ServiceApi {
  final networkService = locator<NetworkService>();

  Future<User?> loginUser(
      {required String phone, required String password}) async {
    AuthResponse? response =
        await networkService.login(phone: phone, password: password);

    return response?.user;
  }

  Future<ForgotPasswordResponse?> forgotPasswordUser(
      {required String phone}) async {
    ForgotPasswordResponse? response =
        await networkService.forgotPassword(phone: phone);

    return response;
  }

  Future<User?> checkOtpUser({required String otp}) async {
    AuthResponse? response = await networkService.checkOtp(otp: otp);

    return response?.user;
  }

  Future<User?> resetPasswordUser(
      {required int id, required String phone, required password}) async {
    AuthResponse? response = await networkService.resetPassword(
        id: id, phone: phone, password: password);

    return response?.user;
  }

  Future<DashboardData?> getUserDashboard() async {
    DashboardModel? response = await networkService.getDashboard();

    return response?.data;
  }

  Future<List<OrdersDatum>?> getUserOrders(OrdersType type) async {
    OrdersModel? response = await networkService.getOrders(type);

    return response.data;
  }
}

import 'dart:io';
import 'package:duka/core/app/app.locator.dart';
import 'package:duka/core/app/app.router.dart';
import 'package:duka/core/models/forgot_password_model.dart';
import 'package:duka/core/services/http_service.dart';
import 'package:duka/core/services/service_api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final api = locator<ServiceApi>();

  void sendOTP({required String phoneNumber}) async {
    setBusy(true);
    try {
      ForgotPasswordResponse? passwordResponse =
          await api.forgotPasswordUser(phone: phoneNumber);

      if (passwordResponse?.data == true) {
        _navigationService.navigateToEnterOtpView(phoneNumber: phoneNumber);
      }
    } on DukaError catch (e) {
      _dialogService.showDialog(
        title: 'Error',
        description: e.message,
      );
    } on SocketException {
      _dialogService.showDialog(
        title: 'Error',
        description: 'Please check your internet',
      );
    } catch (e) {
      _dialogService.showDialog(
        title: 'Error',
        description: 'Something occurred. Please try again later.',
      );
    } finally {
      setBusy(false);
    }
  }
}

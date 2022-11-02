import 'dart:io';
import 'package:duka/core/app/app.locator.dart';
import 'package:duka/core/app/app.router.dart';
import 'package:duka/core/models/auth_model.dart';
import 'package:duka/core/services/http_service.dart';
import 'package:duka/core/services/service_api.dart';
import 'package:duka/core/utilities/storage_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EnterOtpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final api = locator<ServiceApi>();
  final _dialogService = locator<DialogService>();
  final box = GetStorage();

  void confirmOtp({required String otp}) async {
    setBusy(true);
    try {
      User? user = await api.checkOtpUser(otp: otp);
      if (user != null){
        box.write(StorageKey.id, user.id);
        box.write(StorageKey.phone, user.phone);
        _navigationService.navigateTo(Routes.newPasswordView);
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
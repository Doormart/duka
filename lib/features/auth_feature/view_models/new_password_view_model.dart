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

class NewPasswordViewModel extends BaseViewModel{
  bool hideNew = true;
  bool hideConfirm = true;

  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final api = locator<ServiceApi>();
  final box = GetStorage();

  void toggleVisibilityNew(){
    hideNew = !hideNew;
    notifyListeners();
  }

  void toggleVisibilityConfirm(){
    hideConfirm = !hideConfirm;
    notifyListeners();
  }

  void reset ({required String password}) async {
    setBusy(true);
    try {
      int id = box.read(StorageKey.id);
      String phone = box.read(StorageKey.phone);
      User? user = await api.resetPasswordUser(id: id, phone: phone, password: password);
      if (user != null) {
        _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
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
      box.remove(StorageKey.id);
      box.remove(StorageKey.phone);
    }
  }

}
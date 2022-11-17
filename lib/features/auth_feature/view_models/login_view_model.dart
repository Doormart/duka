import 'dart:io';
import 'package:duka/core/app/app.locator.dart';
import 'package:duka/core/app/app.router.dart';
import 'package:duka/core/db/user_db.dart';
import 'package:duka/core/db/user_db_model.dart';
import 'package:duka/core/models/auth_model.dart';
import 'package:duka/core/services/http_service.dart';
import 'package:duka/core/services/service_api.dart';
import 'package:duka/core/utilities/storage_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final api = locator<ServiceApi>();
  final box = GetStorage();

  UserDatabase instance = UserDatabase.instance;
  bool hide = true;

  void toggleVisibility() {
    hide = !hide;
    notifyListeners();
  }

  Future<void> login({required String phone, required String password}) async {
    setBusy(true);
    try {
      User? user = await api.loginUser(phone: phone, password: password);
      if (user != null) {
        box.write(StorageKey.token, user.accessToken);
        _navigationService.pushNamedAndRemoveUntil(
          Routes.landingView,
        );
        final userJson = user.toJson();
        final userDbModel = UserDbModel.fromJson(userJson);
        await instance.create(userDbModel);
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

  void forgotPassword() {
    _navigationService.navigateTo(
      Routes.forgotPasswordView,
    );
  }
}

import 'dart:async';
import 'package:duka/core/app/app.locator.dart';
import 'package:duka/core/app/app.router.dart';
import 'package:duka/core/db/user_db.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OpeningViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  UserDatabase instance = UserDatabase.instance;

  void initialize(){
    Timer(const Duration(seconds: 2), _onboarding,);
  }

  void _onboarding() async {
    try {
      await instance.read();
      _navigationService.pushNamedAndRemoveUntil(
        Routes.landingView,
      );
    } catch (e) {
      _navigationService.pushNamedAndRemoveUntil(Routes.onboardingView);
    }
  }
}
import 'dart:io';
import 'package:duka/core/app/app.locator.dart';
import 'package:duka/core/models/dashboard_model.dart';
import 'package:duka/core/services/http_service.dart';
import 'package:duka/core/services/service_api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final api = locator<ServiceApi>();
  final _dialogService = locator<DialogService>();

  DashboardData? data;

  List<RecentOrder>? get recentOrder => data?.recentOrders?.take(3).toList();

  bool online = false;

  void toggleOnline(bool value) {
    online = value;
    notifyListeners();
  }

  Future<void> getData() async {
    setBusy(true);
    try{
      data = await api.getUserDashboard();
      notifyListeners();
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

  void viewDelivered() {
    //TODO write a nav service
  }

  void viewDistance() {
    //TODO write a nav service
  }

  void viewAllRecentDeliveries() {
    //TODO write a nav service
  }
}

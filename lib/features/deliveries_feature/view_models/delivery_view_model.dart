import 'dart:io';
import 'package:duka/core/app/app.locator.dart';
import 'package:duka/core/app/app.router.dart';
import 'package:duka/core/models/orders_models.dart';
import 'package:duka/core/services/http_service.dart';
import 'package:duka/core/services/network_service.dart';
import 'package:duka/core/services/service_api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final api = locator<ServiceApi>();
  final _dialogService = locator<DialogService>();

  List<OrdersDatum>? completedOrders;
  List<OrdersDatum>? ongoingOrders;
  List<OrdersDatum>? allOrders;

  void getOrders() async {
    await getAllOrders();
    await getOngoingOrders();
    await getCompletedOrders();
  }

  Future<void> getAllOrders() async {
    setBusy(true);
    try{
      allOrders = await api.getUserOrders(OrdersType.all);
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

  Future<void> getOngoingOrders() async {
    setBusy(true);
    try{
      ongoingOrders = await api.getUserOrders(OrdersType.ongoing);
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

  Future<void> getCompletedOrders() async {
    setBusy(true);
    try{
      completedOrders = await api.getUserOrders(OrdersType.completed);
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

  void makePhoneCall(String phoneNumber, bool canLaunch) async {
    if (canLaunch){
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    _dialogService.showDialog(
      title: 'Error',
      description: 'Making phone calls not supported',
    );
  }

  void deliveryDetails(OrdersDatum model, String delivery) {
    _navigationService.navigateToDeliveryDetailsView(model: model, delivery: delivery);
  }
}
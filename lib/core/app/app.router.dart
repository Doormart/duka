// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:duka/core/models/orders_models.dart' as _i12;
import 'package:duka/features/auth_feature/enter_otp_view.dart' as _i7;
import 'package:duka/features/auth_feature/forgot_password_view.dart' as _i6;
import 'package:duka/features/auth_feature/login_view.dart' as _i4;
import 'package:duka/features/auth_feature/new_password_view.dart' as _i8;
import 'package:duka/features/profile_feature/delete_account_view.dart'
    as _i10;
import 'package:duka/features/deliveries_feature/delivery_details_view.dart'
    as _i9;
import 'package:duka/features/landing_feature/landing_view.dart' as _i5;
import 'package:duka/features/onboarding_feature/onboarding_view.dart' as _i3;
import 'package:duka/features/splash_feature/splash_view.dart' as _i2;
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;

class Routes {
  static const splashView = '/';

  static const onboardingView = '/onboarding-view';

  static const loginView = '/login-view';

  static const landingView = '/landing-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const enterOtpView = '/enter-otp-view';

  static const newPasswordView = '/new-password-view';

  static const deliveryDetailsView = '/delivery-details-view';

  static const deleteAccountView = '/delete-account-view';

  static const all = <String>{
    splashView,
    onboardingView,
    loginView,
    landingView,
    forgotPasswordView,
    enterOtpView,
    newPasswordView,
    deliveryDetailsView,
    deleteAccountView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i3.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.landingView,
      page: _i5.LandingView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i6.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.enterOtpView,
      page: _i7.EnterOtpView,
    ),
    _i1.RouteDef(
      Routes.newPasswordView,
      page: _i8.NewPasswordView,
    ),
    _i1.RouteDef(
      Routes.deliveryDetailsView,
      page: _i9.DeliveryDetailsView,
    ),
    _i1.RouteDef(
      Routes.deleteAccountView,
      page: _i10.DeleteAccountView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.OnboardingView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i3.OnboardingView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.LandingView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i5.LandingView(),
        settings: data,
      );
    },
    _i6.ForgotPasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i6.ForgotPasswordView(),
        settings: data,
      );
    },
    _i7.EnterOtpView: (data) {
      final args = data.getArgs<EnterOtpViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i7.EnterOtpView(key: args.key, phoneNumber: args.phoneNumber),
        settings: data,
      );
    },
    _i8.NewPasswordView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i8.NewPasswordView(),
        settings: data,
      );
    },
    _i9.DeliveryDetailsView: (data) {
      final args = data.getArgs<DeliveryDetailsViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i9.DeliveryDetailsView(
            key: args.key, model: args.model, delivery: args.delivery),
        settings: data,
      );
    },
    _i10.DeleteAccountView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i10.DeleteAccountView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class EnterOtpViewArguments {
  const EnterOtpViewArguments({
    this.key,
    required this.phoneNumber,
  });

  final _i11.Key? key;

  final String phoneNumber;
}

class DeliveryDetailsViewArguments {
  const DeliveryDetailsViewArguments({
    this.key,
    required this.model,
    required this.delivery,
  });

  final _i11.Key? key;

  final _i12.OrdersDatum model;

  final String delivery;
}

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLandingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.landingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEnterOtpView({
    _i11.Key? key,
    required String phoneNumber,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.enterOtpView,
        arguments: EnterOtpViewArguments(key: key, phoneNumber: phoneNumber),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNewPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.newPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDeliveryDetailsView({
    _i11.Key? key,
    required _i12.OrdersDatum model,
    required String delivery,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.deliveryDetailsView,
        arguments: DeliveryDetailsViewArguments(
            key: key, model: model, delivery: delivery),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDeleteAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.deleteAccountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

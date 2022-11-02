import 'package:duka/core/services/http_service.dart';
import 'package:duka/core/services/network_service.dart';
import 'package:duka/core/services/service_api.dart';
import 'package:duka/features/auth_feature/enter_otp_view.dart';
import 'package:duka/features/auth_feature/forgot_password_view.dart';
import 'package:duka/features/auth_feature/login_view.dart';
import 'package:duka/features/auth_feature/new_password_view.dart';
import 'package:duka/features/dashboard_feature/delete_account_view.dart';
import 'package:duka/features/dashboard_feature/delivery_details_view.dart';
import 'package:duka/features/onboarding_feature/onboarding_view.dart';
import 'package:duka/features/splash_feature/splash_view.dart';
import 'package:duka/features/dashboard_feature/landing_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

///I'm using stacked architecture for state management, dependency injection, etc, so watch tutorials on it if you dunno about it.
/// for code generation anytime u add anything below: flutter pub run build_runner build --delete-conflicting-outputs

@StackedApp(
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: HttpService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: ServiceApi),
  ],
  routes: [
    AdaptiveRoute(page: SplashView, initial: true),
    AdaptiveRoute(page: OnboardingView),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: LandingView),
    AdaptiveRoute(page: ForgotPasswordView),
    AdaptiveRoute(page: EnterOtpView),
    AdaptiveRoute(page: NewPasswordView),
    AdaptiveRoute(page: DeliveryDetailsView),
    AdaptiveRoute(page: DeleteAccountView),
  ],
  logger: StackedLogger(),
)
class AppSetup{}
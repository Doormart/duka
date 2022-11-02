import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:duka/features/dashboard_feature/deliveries_view.dart';
import 'package:duka/features/dashboard_feature/home_view.dart';
import 'package:duka/features/dashboard_feature/profile_view.dart';
import 'package:duka/features/dashboard_feature/wallet_view.dart';
import 'package:duka/features/dashboard_view_model/landing_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return ViewModelBuilder<LandingViewModel>.reactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (_, model, __) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          backgroundColor: Colors.white,
          selectedItemColor: Palette.primaryColor,
          selectedLabelStyle: TextStyle(
            fontSize: SizeMg.text(12),
            fontWeight: FontWeight.w400,
          ),
          unselectedItemColor: Palette.inactiveGrey,
          unselectedLabelStyle: TextStyle(
            fontSize: SizeMg.text(12),
            fontWeight: FontWeight.w400,
          ),
          type: BottomNavigationBarType.fixed,
          iconSize: 35,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/home.svg',
                color: Palette.primaryColor,
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/package.svg',
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/package.svg',
                color: Palette.primaryColor,
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              label: 'Deliveries',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/wallet.svg',
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/wallet.svg',
                color: Palette.primaryColor,
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/profile.svg',
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/profile.svg',
                color: Palette.primaryColor,
                height: 30,
                fit: BoxFit.fitHeight,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget getViewForIndex(int index){
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const DeliveriesView();
      case 2:
        return const WalletView();
      case 3:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }
}
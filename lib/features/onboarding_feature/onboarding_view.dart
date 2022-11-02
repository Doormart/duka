import 'package:duka/core/app/app.router.dart';
import 'package:duka/core/utilities/color_asset.dart';
import 'package:flutter/material.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:duka/core/app/app.locator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _navigationService = locator<NavigationService>();
  int currentIndex = 0;
  late PageController _controller;

  final List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      imageLink: 'assets/png/splash1.png',
    ),
    OnBoardingModel(
      imageLink: 'assets/png/splash2.png',
    ),
    OnBoardingModel(
      imageLink: 'assets/png/splash3.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: onBoardingList.length,
            itemBuilder: (_, int index) {
              return Container(
                height: deviceHeight,
                width: deviceWidth,
                color: getBgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: SizeMg.height(95),
                    ),
                    Image.asset(
                      onBoardingList[index].imageLink,
                      scale: 4.0,
                      height: SizeMg.height(357),
                    ),
                  ],
                ),
              );
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeMg.width(25),
              vertical: SizeMg.height(25),
            ),
            height: deviceHeight / 3,
            decoration: BoxDecoration(
              color: getContainerColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeMg.radius(50)),
                topRight: Radius.circular(SizeMg.radius(50)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: (currentIndex != 2),
                  child: GestureDetector(
                    onTap: () {
                      _controller.animateToPage(2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SizeMg.text(25),
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeMg.width(25.0)),
                  child: Text(
                    getTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeMg.text(16),
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Builder(
                  builder: (context) {
                    if ((currentIndex != 2)) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: currentIndex == 1,
                            child: GestureDetector(
                              onTap: () {
                                _controller.previousPage(
                                    duration:
                                        const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: Text(
                                'Prev',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeMg.text(25),
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration:
                                      const Duration(milliseconds: 300),
                                  curve: Curves.easeOut);
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: SizeMg.text(25),
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      );
                    }
                    return TextButton(
                      onPressed: () {
                        _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
                      },
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: SizeMg.height(18),
                          ),
                          backgroundColor: Palette.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              SizeMg.radius(15),
                            ),
                          )),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeMg.text(20),
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: deviceHeight / 4,
            left: deviceWidth / 2.8,
            child: Image.asset(
              getLoadImage,
              scale: 4.0,
            ),
          ),
        ],
      ),
    );
  }

  Color get getBgColor {
    switch (currentIndex) {
      case 0:
        return const Color(0xFFC5D0E0);
      case 1:
        return const Color(0xFFDBEEF1);
      default:
        return const Color(0xFFEAEAEA);
    }
  }

  Color get getContainerColor {
    switch (currentIndex) {
      case 2:
        return Palette.blackGreen;
      default:
        return Palette.splashContainer;
    }
  }

  String get getTitle {
    switch (currentIndex) {
      case 0:
        return 'Use DUKA Ryda to find delivery requests around you and accept \n/decline offer';
      case 1:
        return 'Get to the pickup location as soon as possible to collect user’s order.';
      default:
        return 'Deliver order to delivery location on time and get paid.';
    }
  }

  String get getLoadImage {
    switch (currentIndex){
      case 0:
        return 'assets/png/splashLoad1.png';
      case 1:
        return 'assets/png/splashLoad2.png';
      default:
        return 'assets/png/splashLoad3.png';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class OnBoardingModel {
  late String imageLink;

  OnBoardingModel({
    required this.imageLink,
  });
}

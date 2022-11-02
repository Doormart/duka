import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/features/splash_feature/opening_view_model.dart';
import 'package:flutter/material.dart';
import 'package:duka/core/utilities/size_manager.dart';

class OpeningView extends StatefulWidget {
  const OpeningView({Key? key}) : super(key: key);

  @override
  State<OpeningView> createState() => _OpeningViewState();
}

class _OpeningViewState extends State<OpeningView> {
  final _model = OpeningViewModel();

  @override
  void initState() {
    super.initState();
    _model.initialize();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'D',
              style: TextStyle(
                fontFamily: 'Peralta',
                fontWeight: FontWeight.w400,
                fontSize: SizeMg.text(70),
                color: const Color(0xFF262B2C),
              ),
              children: [
                TextSpan(
                  text: 'uka',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeMg.text(70),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Ryda',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: SizeMg.text(40),
              fontWeight: FontWeight.w400,
              color: const Color(0xFFFFF4F0),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

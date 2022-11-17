import 'package:duka/core/utilities/otp_formatter.dart';
import 'package:duka/features/auth_feature/view_models/enter_otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:flutter/services.dart';
import 'package:duka/core/shareable_widgets/primary_button.dart';
import 'package:duka/core/utilities/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

class EnterOtpView extends StatefulWidget {

  final String phoneNumber;

  const EnterOtpView({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<EnterOtpView> createState() => _EnterOtpViewState();
}

class _EnterOtpViewState extends State<EnterOtpView> {
  final _formKey = GlobalKey<FormState>();
  final FocusManager focusManager = FocusManager.instance;
  Color fillNumberColor = Palette.staleWhite;
  late TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return GestureDetector(
      onTap: () => focusManager.primaryFocus?.unfocus(),
      child: ViewModelBuilder<EnterOtpViewModel>.reactive(
        viewModelBuilder: () => EnterOtpViewModel(),
        builder: (_, model, __) => ModalProgressHUD(
          inAsyncCall: model.isBusy,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Palette.blackGreen,
                ),
              ),
              title: Text(
                'Enter phone number',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: SizeMg.text(20),
                  color: Palette.blackGreen,
                ),
              ),
              titleSpacing: 0,
            ),
            body: SafeArea(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.only(
                      left: SizeMg.width(26.0),
                      right: SizeMg.width(26.0),
                      top: SizeMg.height(20.0),
                    ),
                    children: [
                      Text(
                        'Confirm phone number',
                        style: TextStyle(
                          fontSize: SizeMg.text(25),
                          fontWeight: FontWeight.w400,
                          color: Palette.blackGreen,
                        ),
                      ),
                      SizedBox(
                        height: SizeMg.height(32),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'An otp code has been sent to ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: SizeMg.text(20),
                            fontWeight: FontWeight.w400,
                            color: Palette.secondaryBlack,
                          ),
                          children: [
                            TextSpan(
                              text: widget.phoneNumber,
                              style: const TextStyle(
                                color: Palette.altGreen,
                              ),
                            ),
                            const TextSpan(
                              text: ' as text message to verify your phone number',
                              style: TextStyle(
                                color: Palette.secondaryBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeMg.height(32),
                      ),
                      Text(
                        'OTP',
                        style: TextStyle(
                          fontSize: SizeMg.text(16),
                          fontWeight: FontWeight.w400,
                          color: Palette.secondaryBlack,
                        ),
                      ),
                      SizedBox(
                        height: SizeMg.height(12),
                      ),
                      TextFormField(
                        controller: _numberController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: SizeMg.text(18),
                          fontWeight: FontWeight.w400,
                          color: Palette.blackGreen,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          OtpFormatter()
                        ],
                        decoration: kFormTextDecoration.copyWith(
                          hintText: 'e.g - 1908201',
                          fillColor: fillNumberColor,
                        ),
                        onChanged: (value) {
                          toggleFillNumberColor(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'OTP code cannot be empty';
                          }
                          if (value.length != 4) {
                            return 'OTP code must be 4 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: SizeMg.height(32),
                      ),
                      PrimaryButton(
                        buttonConfig: ButtonConfig(
                          text: 'Next',
                          action: (){
                            if(_formKey.currentState!.validate()){
                              model.confirmOtp(otp: _numberController.text.trim());
                            }
                            focusManager.primaryFocus?.unfocus();
                          },
                          disabled: _numberController.text.isEmpty,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }

  void toggleFillNumberColor(String s){
    if (s.isEmpty){
      setState(() {
        fillNumberColor = Palette.staleWhite;
      });
    }
    else {
      setState(() {
        fillNumberColor = Palette.offWhite;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _numberController.dispose();
  }
}


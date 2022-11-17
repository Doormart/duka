import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/constants.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:duka/features/auth_feature/view_models/forgot_password_view_model.dart';
import 'package:duka/core/shareable_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
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
      child: ViewModelBuilder<ForgotPasswordViewModel>.reactive(
        viewModelBuilder: () => ForgotPasswordViewModel(),
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
                'Forgot Password',
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
                      'Put in your phone number',
                      style: TextStyle(
                        fontSize: SizeMg.text(25),
                        fontWeight: FontWeight.w400,
                        color: Palette.blackGreen,
                      ),
                    ),
                    SizedBox(
                      height: SizeMg.height(32),
                    ),
                    Text(
                      'An otp code will be sent to you as text message to verify your phone number',
                      style: TextStyle(
                        fontSize: SizeMg.text(20),
                        fontWeight: FontWeight.w400,
                        color: Palette.secondaryBlack,
                      ),
                    ),
                    SizedBox(
                      height: SizeMg.height(32),
                    ),
                    Text(
                      'Phone number',
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
                      decoration: kFormTextDecoration.copyWith(
                        hintText: 'Phone number',
                        fillColor: fillNumberColor,
                      ),
                      onChanged: (value) {
                        toggleFillNumberColor(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone number cannot be empty';
                        }
                        if (value.contains(RegExp(r'(\D)'))) {
                          return 'Phone number must contain only numbers';
                        }
                        if (value.length < 11) {
                          return 'Phone number must be at least 11 numbers';
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
                        action: () {
                          if (_formKey.currentState!.validate()) {
                            model.sendOTP(
                                phoneNumber: _numberController.text.trim());
                          }
                          focusManager.primaryFocus?.unfocus();
                        },
                        disabled: _numberController.text.length < 11,
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

  void toggleFillNumberColor(String s) {
    if (s.isEmpty) {
      setState(() {
        fillNumberColor = Palette.staleWhite;
      });
    } else {
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

import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/constants.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:duka/features/auth_feature/view_models/login_view_model.dart';
import 'package:duka/core/shareable_widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final FocusManager focusManager = FocusManager.instance;
  Color fillNumberColor = Palette.staleWhite;
  Color fillPasswordColor = Palette.staleWhite;
  Color visibilityIconColor = Palette.inactiveGrey;

  late TextEditingController _numberController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return GestureDetector(
      onTap: () => focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ViewModelBuilder<LoginViewModel>.reactive(
          viewModelBuilder: () => LoginViewModel(),
          builder: (_, model, __) {
            return ModalProgressHUD(
              inAsyncCall: model.isBusy,
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(25.0),
                    ),
                    children: [
                      SizedBox(
                        height: SizeMg.height(53),
                      ),
                      SizedBox(
                        height: SizeMg.height(110),
                        width: SizeMg.width(110),
                        child: Image.asset(
                          'assets/png/splashLoad3.png',
                          scale: 4.0,
                        ),
                      ),
                      SizedBox(
                        height: SizeMg.height(72),
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
                        textInputAction: TextInputAction.next,
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
                      Text(
                        'Password',
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
                        controller: _passwordController,
                        textInputAction: TextInputAction.done,
                        obscureText: model.hide,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          fontSize: SizeMg.text(18),
                          fontWeight: FontWeight.w400,
                          color: Palette.blackGreen,
                        ),
                        decoration: kFormTextDecoration.copyWith(
                          hintText: 'Enter password',
                          fillColor: fillPasswordColor,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _passwordController.text.isEmpty
                                  ? null
                                  : model.toggleVisibility();
                            },
                            icon: Icon(
                              model.hide ? Icons.visibility : Icons.visibility_off,
                              color: visibilityIconColor,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          toggleFillPasswordColor(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          if (value.length < 6) {
                            return 'Password length must be greater than six';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: SizeMg.height(16),
                      ),
                      GestureDetector(
                        onTap: (){
                          model.forgotPassword();
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Palette.primaryColor,
                            fontSize: SizeMg.text(18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeMg.height(56),
                      ),
                      PrimaryButton(
                        buttonConfig: ButtonConfig(
                          text: 'Login',
                          action: () {
                            if (_formKey.currentState!.validate()) {
                              model.login(phone: _numberController.text.trim(),
                                  password: _passwordController.text.trim());
                            }
                            focusManager.primaryFocus?.unfocus();
                          },
                          disabled: !(_passwordController.text.isNotEmpty &&
                              _numberController.text.isNotEmpty),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
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

  void toggleFillPasswordColor(String s){
    if (s.isEmpty){
      setState(() {
        fillPasswordColor = Palette.staleWhite;
        visibilityIconColor = Palette.inactiveGrey;
      });
    }
    else {
      setState(() {
        fillPasswordColor = Palette.offWhite;
        visibilityIconColor = Palette.blackGreen;
      });
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _numberController.dispose();
    super.dispose();
  }
}

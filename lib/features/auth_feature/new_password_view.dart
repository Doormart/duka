import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/features/auth_feature/view_models/new_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:duka/core/utilities/constants.dart';
import 'package:duka/core/shareable_widgets/primary_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({Key? key}) : super(key: key);

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final FocusManager focusManager = FocusManager.instance;

  Color newPasswordFillColor = Palette.staleWhite;
  Color confirmPasswordFillColor = Palette.staleWhite;
  Color newIconColor = Palette.inactiveGrey;
  Color confirmIconColor = Palette.inactiveGrey;

  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return GestureDetector(
      onTap: () => focusManager.primaryFocus?.unfocus(),
      child: ViewModelBuilder<NewPasswordViewModel>.reactive(
        viewModelBuilder: () => NewPasswordViewModel(),
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
                'Create new password',
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
                    top: SizeMg.height(40.0),
                  ),
                  children: [
                    Text(
                      'Passwords must have at least 6 characters',
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
                      'New Password',
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
                      controller: _newPasswordController,
                      textInputAction: TextInputAction.next,
                      obscureText: model.hideNew,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        fontSize: SizeMg.text(18),
                        fontWeight: FontWeight.w400,
                        color: Palette.blackGreen,
                      ),
                      decoration: kFormTextDecoration.copyWith(
                        hintText: 'New password',
                        fillColor: newPasswordFillColor,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _newPasswordController.text.isEmpty
                                ? null
                                : model.toggleVisibilityNew();
                          },
                          icon: Icon(
                            model.hideNew ? Icons.visibility : Icons.visibility_off,
                            color: newIconColor,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        toggleNewPasswordColor(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (value.length < 6) {
                          return 'Password must contain 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: SizeMg.height(32),
                    ),
                    Text(
                      'Confirm Password',
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
                      controller: _confirmPasswordController,
                      textInputAction: TextInputAction.done,
                      obscureText: model.hideConfirm,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.black,
                      style: TextStyle(
                        fontSize: SizeMg.text(18),
                        fontWeight: FontWeight.w400,
                        color: Palette.blackGreen,
                      ),
                      decoration: kFormTextDecoration.copyWith(
                        hintText: 'Confirm Password',
                        fillColor: confirmPasswordFillColor,
                        suffixIcon: IconButton(
                          onPressed: () {
                            _confirmPasswordController.text.isEmpty
                                ? null
                                : model.toggleVisibilityConfirm();
                          },
                          icon: Icon(
                            model.hideConfirm ? Icons.visibility : Icons.visibility_off,
                            color: confirmIconColor,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        toggleConfirmPasswordColor(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (value.length < 6) {
                          return 'Password must contain 6 characters';
                        }
                        if (value != _newPasswordController.text){
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: SizeMg.height(48),
                    ),
                    PrimaryButton(
                      buttonConfig: ButtonConfig(
                        text: 'Submit',
                        action: (){
                          if(_formKey.currentState!.validate()){
                            model.reset(password: _confirmPasswordController.text.trim());
                          }
                          focusManager.primaryFocus?.unfocus();
                        },
                        disabled: !(_newPasswordController.text.isNotEmpty &&
                            _confirmPasswordController.text.isNotEmpty),
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

  void toggleNewPasswordColor(String s){
    if (s.isEmpty){
      setState(() {
        newPasswordFillColor = Palette.staleWhite;
        newIconColor = Palette.inactiveGrey;
      });
    }
    else {
      setState(() {
        newPasswordFillColor = Palette.offWhite;
        newIconColor = Palette.blackGreen;
      });
    }
  }

  void toggleConfirmPasswordColor(String s){
    if (s.isEmpty){
      setState(() {
        confirmPasswordFillColor = Palette.staleWhite;
        confirmIconColor = Palette.inactiveGrey;
      });
    }
    else {
      setState(() {
        confirmPasswordFillColor = Palette.offWhite;
        confirmIconColor = Palette.blackGreen;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
  }
}

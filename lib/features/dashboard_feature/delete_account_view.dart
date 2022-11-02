import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:duka/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({Key? key}) : super(key: key);

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
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
          'Delete account',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeMg.text(20),
            color: Palette.blackGreen,
          ),
        ),
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: SizeMg.width(31),
            vertical: SizeMg.height(18),
          ),
          children: [
            Text(
              'By doing this:',
              style: TextStyle(
                fontSize: SizeMg.text(18),
                color: Palette.blackGreen,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeMg.width(8),
                vertical: SizeMg.height(15),
              ),
              child: Text(
                '1. You will no longer have access to this account.',
                style: TextStyle(
                  fontSize: SizeMg.text(18),
                  color: Palette.secondaryBlack,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeMg.width(8),
              ),
              child: Text(
                '2. All delivery history will be erased from this account.',
                style: TextStyle(
                  fontSize: SizeMg.text(18),
                  color: Palette.secondaryBlack,
                ),
              ),
            ),
            SizedBox(
              height: SizeMg.height(40),
            ),
            Text(
              'Kindly let us know why you’re leaving',
              style: TextStyle(
                fontSize: SizeMg.text(20),
                color: Palette.blackGreen,
              ),
            ),
            SizedBox(
              height: SizeMg.height(17),
            ),
            TextField(
              cursorColor: Palette.blackGreen,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 3,
              style: TextStyle(
                color: Palette.blackGreen,
                fontSize: SizeMg.text(16),
              ),
              decoration: InputDecoration(
                hintText: 'Let us know why',
                hintStyle: const TextStyle(
                  color: Palette.darkGrey,
                ),
                filled: true,
                fillColor: Palette.offWhite,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    SizeMg.radius(15),
                  ),
                  borderSide: BorderSide(
                    color: Palette.staleBlue,
                    width: SizeMg.width(2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    SizeMg.radius(15),
                  ),
                  borderSide: BorderSide(
                    color: Palette.staleBlue,
                    width: SizeMg.width(2),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeMg.height(50),
            ),
            PrimaryButton(
              buttonConfig: ButtonConfig(
                text: 'Delete account',
                action: () {},
              ),
            ),
            SizedBox(
              height: SizeMg.height(30),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeMg.text(20),
                  color: Palette.blackGreen,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

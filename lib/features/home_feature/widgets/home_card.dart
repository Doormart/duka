import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeCard extends StatelessWidget {
  final String image, title, totalTitle;
  final Function() tapAction;
  final int total;

  const HomeCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.tapAction,
      required this.total,
      required this.totalTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeMg.height(97),
      width: SizeMg.width(237),
      padding: EdgeInsets.symmetric(
        horizontal: SizeMg.width(8),
        vertical: SizeMg.height(13),
      ),
      margin: EdgeInsets.only(
        right: SizeMg.width(17),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          SizeMg.radius(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                image,
              ),
              SizedBox(
                width: SizeMg.width(4),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: SizeMg.text(12),
                  fontWeight: FontWeight.w400,
                  color: Palette.darkGrey,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: tapAction,
                child: Text(
                  'View',
                  style: TextStyle(
                    fontSize: SizeMg.text(12),
                    fontWeight: FontWeight.w500,
                    color: Palette.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                total.toString(),
                style: TextStyle(
                  fontSize: SizeMg.text(25),
                  fontWeight: FontWeight.w500,
                  color: Palette.blackGreen,
                ),
              ),
              SizedBox(
                width: SizeMg.width(5),
              ),
              Text(
                totalTitle,
                style: TextStyle(
                  fontSize: SizeMg.text(14),
                  fontWeight: FontWeight.w400,
                  color: Palette.blackGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

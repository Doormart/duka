import 'package:dotted_line/dotted_line.dart';
import 'package:duka/core/models/orders_models.dart';
import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeliveryContainer extends StatelessWidget {
  final OrdersDatum model;
  final Widget sign;
  final Function() tapAction;

  const DeliveryContainer({
    Key? key,
    required this.model,
    required this.sign,
    required this.tapAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return GestureDetector(
      onTap: tapAction,
      child: Container(
        width: double.maxFinite,
        height: SizeMg.height(146),
        decoration: BoxDecoration(
          color: Palette.offWhite,
          borderRadius: BorderRadius.circular(
            SizeMg.radius(15),
          ),
        ),
        margin: EdgeInsets.only(
          left: SizeMg.width(31),
          right: SizeMg.width(31),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.location_on_sharp,
                  color: Palette.primaryColor,
                ),
                DottedLine(
                  lineLength: SizeMg.height(51),
                  dashLength: 7,
                  dashGapLength: 5,
                  lineThickness: 2,
                  direction: Axis.vertical,
                  dashColor: Palette.primaryColor,
                ),
                SvgPicture.asset(
                  'assets/svg/destination.svg',
                ),
              ],
            ),
            SizedBox(
              width: SizeMg.width(151),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.vendor?.name ?? 'Not set',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeMg.text(16),
                          color: Palette.blackGreen,
                        ),
                      ),
                      Text(
                        model.vendor?.address ?? 'Not set',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeMg.text(12),
                          color: Palette.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.user?.name ?? 'Not set',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeMg.text(16),
                          color: Palette.blackGreen,
                        ),
                      ),
                      Text(
                        model.user?.address ?? 'Not set',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeMg.text(12),
                          color: Palette.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sign,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeMg.width(9),
                    vertical: SizeMg.height(5),
                  ),
                  color: Colors.white,
                  child: Text(
                    'Not Set',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeMg.text(14),
                      color: Palette.secondaryBlack,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

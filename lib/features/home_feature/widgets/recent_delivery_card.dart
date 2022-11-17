import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:flutter/material.dart';

class RecentDeliveryCard extends StatelessWidget {
  final String orderNumber, orderDateTime;

  const RecentDeliveryCard({
    Key? key,
    required this.orderNumber,
    required this.orderDateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeMg.width(10),
        vertical: SizeMg.height(12),
      ),
      decoration: BoxDecoration(
        color: Palette.offWhite,
        borderRadius: BorderRadius.circular(
          SizeMg.radius(15),
        ),
      ),
      margin: EdgeInsets.only(
        bottom: SizeMg.height(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            orderNumber,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Palette.secondaryBlack,
              fontSize: SizeMg.text(16),
            ),
          ),
          Text(
            orderDateTime,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Palette.darkGrey,
              fontSize: SizeMg.text(12),
            ),
          ),
        ],
      ),
    );
  }
}

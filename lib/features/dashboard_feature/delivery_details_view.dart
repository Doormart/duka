import 'package:dotted_line/dotted_line.dart';
import 'package:duka/core/models/orders_models.dart';
import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:duka/features/dashboard_view_model/delivery_view_model.dart';
import 'package:duka/features/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryDetailsView extends StatefulWidget {
  final OrdersDatum model;
  final String delivery;

  const DeliveryDetailsView({
    Key? key,
    required this.model,
    required this.delivery,
  }) : super(key: key);

  @override
  State<DeliveryDetailsView> createState() => _DeliveryDetailsViewState();
}

class _DeliveryDetailsViewState extends State<DeliveryDetailsView> {
  DeliveryViewModel deliveryViewModel = DeliveryViewModel();

  late OrdersDatum _model;
  late Jiffy date;
  late String pastTime;
  late String completedTime;
  late bool result;

  @override
  void initState() async {
    super.initState();
    bool response = await canLaunchUrl(Uri(
      scheme: 'tel',
      path: '123',
    ));
    result = response;
    _model = widget.model;
    // if (widget.delivery.toLowerCase() == 'completed') {
    //   date = Jiffy(DateTime.parse(_model.date!));
    //   completedTime = date.format('hh:mm a');
    //   pastTime = date.subtract(minutes: _model.minutes).format('hh:mm a');
    // }
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Palette.blackGreen,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeMg.height(34),
              horizontal: SizeMg.width(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _model.orderId ?? 'Not Set',
                  style: TextStyle(
                    fontSize: SizeMg.text(25),
                    color: Palette.blackGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(42),
                ),
                Text(
                  'Pickup',
                  style: TextStyle(
                    fontSize: SizeMg.text(14),
                    color: Palette.darkGrey,
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      color: Palette.primaryColor,
                    ),
                    SizedBox(
                      width: SizeMg.width(181),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _model.vendor?.name ?? 'Not Set',
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeMg.text(16),
                              color: Palette.blackGreen,
                            ),
                          ),
                          Text(
                            _model.vendor?.address ?? 'Not Set',
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeMg.text(12),
                              color: Palette.darkGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (ctx) {
                        if (widget.delivery.toLowerCase() == 'completed') {
                          return timeWidget(pastTime);
                        } else {
                          return GestureDetector(
                            onTap: (){
                              deliveryViewModel.makePhoneCall(_model.vendor!.phone!, result);
                            },
                            child: SvgPicture.asset(
                              'assets/svg/phone.svg',
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeMg.height(18),
                ),
                const Align(
                  child: DottedLine(
                    lineLength: 59,
                    direction: Axis.vertical,
                    dashColor: Palette.primaryColor,
                    dashLength: 15,
                  ),
                ),
                Text(
                  'Destination',
                  style: TextStyle(
                    fontSize: SizeMg.text(14),
                    color: Palette.darkGrey,
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/svg/destination.svg'),
                    SizedBox(
                      width: SizeMg.width(181),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _model.user?.name ?? 'Not Set',
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeMg.text(16),
                              color: Palette.blackGreen,
                            ),
                          ),
                          Text(
                            _model.user?.address ?? 'Not Set',
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: SizeMg.text(12),
                              color: Palette.darkGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (ctx) {
                        if (widget.delivery.toLowerCase() == 'completed') {
                          return timeWidget(completedTime);
                        } else {
                          return GestureDetector(
                            onTap: (){
                              deliveryViewModel.makePhoneCall(_model.user!.phone!, result);
                            },
                            child: SvgPicture.asset(
                              'assets/svg/phone.svg',
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const DottedLine(
            dashGapLength: 0,
            dashColor: Palette.inactiveGrey,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: SizeMg.height(26),
              left: SizeMg.width(30),
              right: SizeMg.width(30),
              bottom: SizeMg.height(60),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (widget.delivery.toLowerCase() == 'completed')
                          ? 'Total distance travelled'
                          : 'Estimated delivery distance',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeMg.text(12),
                        color: Palette.darkGrey,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Not Set',
                        style: TextStyle(
                          fontSize: SizeMg.text(20),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Palette.blackGreen,
                        ),
                        children: [
                          TextSpan(
                            text: ' KM',
                            style: TextStyle(
                              fontSize: SizeMg.text(12),
                              fontWeight: FontWeight.w400,
                              color: Palette.secondaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeMg.height(16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (widget.delivery.toLowerCase() == 'completed')
                          ? 'Total delivery time'
                          : 'Estimated delivery time',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeMg.text(12),
                        color: Palette.darkGrey,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Not Set',
                        style: TextStyle(
                          fontSize: SizeMg.text(20),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: Palette.blackGreen,
                        ),
                        children: [
                          TextSpan(
                            text: ' mins',
                            style: TextStyle(
                              fontSize: SizeMg.text(12),
                              fontWeight: FontWeight.w400,
                              color: Palette.secondaryBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeMg.height(16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (widget.delivery.toLowerCase() == 'completed')
                          ? 'Total earning'
                          : 'Estimated earning',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: SizeMg.text(12),
                        color: Palette.darkGrey,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '\u{20A6}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeMg.text(20.0),
                          color: Palette.blackGreen,
                        ),
                        children: [
                          TextSpan(
                            text: _model.deliveryFee?.toString() ?? 'Not Set',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Builder(
            builder: (ctx){
              if (widget.delivery.toLowerCase() == 'completed'){
                return Text(
                  'View journey details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Palette.primaryColor,
                    fontSize: SizeMg.text(18),
                  ),
                );
              } else {
                return Column(
                  children: [
                    PrimaryButton(
                      buttonConfig: ButtonConfig(
                        text: 'Accept',
                        action: (){
                          //TODO view another screen
                        },
                        disabled: false,
                      ),
                      margin: EdgeInsets.only(
                        left: SizeMg.width(30),
                        right: SizeMg.width(30),
                        bottom: SizeMg.height(15),
                      ),
                    ),
                    PrimaryButton(
                      textColor: Palette.darkRed,
                      color: Palette.lightRed,
                      buttonConfig: ButtonConfig(
                        text: 'Decline',
                        action: (){
                          //TODO view another screen
                        },
                        disabled: false,
                      ),
                      margin: EdgeInsets.only(
                        left: SizeMg.width(30),
                        right: SizeMg.width(30),
                        bottom: SizeMg.height(25),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget timeWidget(String time) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeMg.width(9),
        vertical: SizeMg.height(5),
      ),
      color: Palette.offWhite,
      child: Text(
        'Not Set',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: SizeMg.text(14),
          color: Palette.secondaryBlack,
        ),
      ),
    );
  }
}

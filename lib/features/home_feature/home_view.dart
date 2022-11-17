import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:duka/features/home_feature/view_models/home_view_model.dart';
import 'package:duka/features/home_feature/widgets/home_card.dart';
import 'package:duka/features/home_feature/widgets/recent_delivery_card.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Palette.offWhite,
      body: ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.getData(),
        fireOnModelReadyOnce: true,
        disposeViewModel: false,
        builder: (_, model, __) {
          if (model.isBusy) {
            return const Center(
              child: CircularProgressIndicator(
                color: Palette.primaryColor,
              ),
            );
          }
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeMg.width(29),
                    vertical: SizeMg.height(31.5),
                  ),
                  margin: EdgeInsets.only(
                    bottom: SizeMg.width(24),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: SizeMg.text(20),
                          fontWeight: FontWeight.w500,
                          color: Palette.blackGreen,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.notifications_none_rounded,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeMg.width(31),
                    right: SizeMg.width(31),
                    bottom: SizeMg.height(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeMg.width(10),
                            vertical: SizeMg.height(9),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              SizeMg.radius(7),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.event,
                              ),
                              SizedBox(
                                width: SizeMg.width(10),
                              ),
                              Text(
                                'Today',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeMg.text(12),
                                  color: Palette.blackGreen,
                                ),
                              ),
                              SizedBox(
                                width: SizeMg.width(18),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                              )
                            ],
                          ),
                        ),
                      ),
                      Switch(
                        value: model.online,
                        onChanged: model.toggleOnline,
                        activeTrackColor: Palette.primaryColor,
                        inactiveTrackColor: Colors.white,
                        thumbColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.white;
                          }
                          return Palette.inactiveGrey;
                        }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(99),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(
                      left: SizeMg.width(31),
                    ),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      HomeCard(
                        image: 'assets/svg/deliveries.svg',
                        title: 'Delivered',
                        tapAction: model.viewDelivered,
                        total: model.data?.deliveredOrders ?? 0,
                        totalTitle: 'Deliveries',
                      ),
                      HomeCard(
                        image: 'assets/svg/distance.svg',
                        title: 'Distance',
                        tapAction: model.viewDistance,
                        total: model.data?.distanceCovered ?? 0,
                        totalTitle: 'Km',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: SizeMg.width(30),
                      right: SizeMg.width(30),
                      top: SizeMg.height(34),
                    ),
                    margin: EdgeInsets.only(
                      top: SizeMg.height(34),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          SizeMg.radius(50),
                        ),
                        topRight: Radius.circular(
                          SizeMg.radius(50),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Hero(
                              tag: 'recentDeliveries',
                              child: Text(
                                'Recent Deliveries',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeMg.text(20),
                                  color: Palette.blackGreen,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: model.viewAllRecentDeliveries,
                              child: Text(
                                'View all',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeMg.text(12),
                                  color: Palette.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: SizeMg.height(30),
                        ),
                        Builder(
                          builder: (ctx) {
                            if (model.data == null || model.data!.recentOrders != null ||
                                model.data!.recentOrders!.isEmpty) {
                              return const Center(
                                child: Text(
                                  'No recent delivery',
                                ),
                              );
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: model.recentOrder!.length,
                              itemBuilder: (BuildContext ctx, int index) =>
                                  RecentDeliveryCard(
                                orderNumber: model.recentOrder![index].orderId!,
                                orderDateTime: Jiffy(DateTime.parse(
                                        model.recentOrder![index].createdAt!))
                                    .format('MMM. do, yyyy, h:mma'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

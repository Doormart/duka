import 'package:duka/core/utilities/color_asset.dart';
import 'package:duka/core/utilities/size_manager.dart';
import 'package:duka/features/deliveries_feature/view_models/delivery_view_model.dart';
import 'package:duka/features/deliveries_feature/widgets/delivery_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class DeliveriesView extends StatefulWidget {
  const DeliveriesView({Key? key}) : super(key: key);

  @override
  State<DeliveriesView> createState() => _DeliveriesViewState();
}

class _DeliveriesViewState extends State<DeliveriesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Deliveries',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeMg.text(20),
            color: Palette.blackGreen,
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Palette.darkGrey,
          controller: _tabController,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeMg.text(14),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SizeMg.width(31),
          ),
          indicator: BoxDecoration(
              color: Palette.primaryColor,
              borderRadius: BorderRadius.circular(SizeMg.radius(7),),),
          tabs: const [
            Tab(
              text: 'Requests',
            ),
            Tab(
              text: 'Ongoing',
            ),
            Tab(
              text: 'Completed',
            ),
          ],
        ),
      ),
      body: ViewModelBuilder<DeliveryViewModel>.reactive(
        viewModelBuilder: () => DeliveryViewModel(),
        onModelReady: (model) => model.getOrders(),
        disposeViewModel: false,
        fireOnModelReadyOnce: true,
        builder: (_, model, __) => TabBarView(
          controller: _tabController,
          children: [
            Builder(
              builder: (context) {
                if (model.isBusy) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Palette.primaryColor,
                    ),
                  );
                } if (model.allOrders == null || model.allOrders!.isEmpty) {
                  return const Center(
                    child: Text(
                      'No delivery request',
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: model.allOrders!.length,
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext ctx, int index) => DeliveryContainer(
                    model: model.allOrders![index],
                    tapAction: (){
                      model.deliveryDetails(model.allOrders![index], model.allOrders![index].orderStatus!);
                    },
                    sign: const Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ),
                  separatorBuilder: (c, i) => const SizedBox(
                    height: 22,
                  ),
                );
              }
            ),
            Builder(
                builder: (context) {
                  if (model.isBusy) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Palette.primaryColor,
                      ),
                    );
                  } if (model.ongoingOrders == null || model.ongoingOrders!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No delivery ongoing',
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: model.ongoingOrders!.length,
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext ctx, int index) => DeliveryContainer(
                      model: model.ongoingOrders![index],
                      tapAction: (){
                        model.deliveryDetails(model.ongoingOrders![index], model.ongoingOrders![index].orderStatus!);
                      },
                      sign: const Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                    separatorBuilder: (c, i) => const SizedBox(
                      height: 22,
                    ),
                  );
                }
            ),
            Builder(
              builder: (context) {
                if (model.isBusy) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Palette.primaryColor,
                    ),
                  );
                } if (model.completedOrders == null || model.completedOrders!.isEmpty) {
                  return const Center(
                    child: Text(
                      'No delivery completed',
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: model.completedOrders!.length,
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext ctx, int index) => DeliveryContainer(
                    model: model.completedOrders![index],
                    tapAction: (){
                      model.deliveryDetails(model.completedOrders![index], model.completedOrders![index].orderStatus!);
                    },
                    sign: SvgPicture.asset('assets/svg/mark.svg'),
                  ),
                  separatorBuilder: (c, i) => const SizedBox(
                    height: 22,
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}

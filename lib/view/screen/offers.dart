import 'package:exfai/all_export.dart';
import 'package:exfai/controller/offer_controller.dart';
import 'package:exfai/view/widget/offer/custumitem_offer.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
     FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(
        builder: (controller) => Container(
          padding: EdgeInsets.symmetric(horizontal:10),
          child: ListView(
            children:[
              CustomAppBar(
                    mycontroller: controller.search!,
                    titleappbar: "Find Product",
                    // onPressedIcon: () {},
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoute.myfavroite);
                    },
                  ),
                  SizedBox( height:20),
                  controller.isSearch ?
                   HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        CustomListItemsOffer(itemsModel: controller.data[index])))):ListItemsSearch(listdatamodel: controller.listdata)
               ] ),
        ));
  }
}

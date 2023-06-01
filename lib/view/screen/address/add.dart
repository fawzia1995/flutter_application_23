// ignore_for_file: unused_local_variable, avoid_unnecessary_containers

import '../../../../all_export.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerpage = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add new address'),
      ),
      body: Container(
        child: GetBuilder<AddAddressController>(
            builder: ((controllerpage) => HandlingDataView(
                statusRequest: controllerpage.statusRequest,
                widget: Column(children: [
                  if (controllerpage.kGooglePlex != null)
                    Expanded(
                        child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          mapType: MapType.normal,
                          markers: controllerpage.markers.toSet(),
                          onTap: (latlong) {
                            controllerpage.addMarkers(latlong);
                          },
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerpage.completercontroller!
                                .complete(controllermap);
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          child: Container(
                            child: MaterialButton(
                              minWidth: 200,
                              onPressed: () {
                                controllerpage.goToPageAddDetailsAddress();
                              },
                              color: AppColor.primaryColor,
                              textColor: Colors.white,
                              child: const Text("اكمال",
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        )
                      ],
                    ))
                ])))),
      ),
    );
  }
}

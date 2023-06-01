// ignore_for_file: unused_local_variable, avoid_unnecessary_containers

import '../../all_export.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Container(
      child: GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(children: [
                    const Center(
                        child: Text(
                      "Notification",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 10),
                    ...List.generate(
                        controller.data.length,
                        (index) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Stack(
                                children: [
                                  ListTile(
                                    title: Text(controller.data[index]
                                        ['notification_title']),
                                    subtitle: Text(controller.data[index]
                                        ['notification_body']),
                                  ),
                                  Positioned(
                                      right: 5,
                                      child: Text(
                                        Jiffy.parseFromDateTime(controller
                                                .data[index]
                                                    ['notification_datetime']
                                                .toDate())
                                            .fromNow(),
                                        style: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ))
                  ])))),
    );
  }
}

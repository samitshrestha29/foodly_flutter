import 'package:get/get.dart';

class AdditiveObs extends GetxController {
  final String title;
  final String price;
  final String id;
  RxBool isChecked = false.obs;

  AdditiveObs({
    required this.title,
    required this.price,
    required this.id,
    bool checked = false,
  }) {
    isChecked.value = checked;
  }

  void toggleChecked() {
    isChecked.value = !isChecked.value;
  }
}

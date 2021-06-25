import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage_exam/models/user.dart';
import 'package:get_storage_exam/services/locale_db.dart';

class HomeScreenController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController lastnameController;
  late TextEditingController ageController;
  late GlobalKey<FormState> formKey = GlobalKey();

  @override
  void onInit() {
    nameController = TextEditingController();
    lastnameController = TextEditingController();
    ageController = TextEditingController();
    super.onInit();
  }

  void addUser() {
    if (formKey.currentState!.validate()) {
      Get.find<LocaleDb>().addInfo(User(
        name: nameController.text,
        lastName: lastnameController.text,
        age: int.parse(ageController.text),
      ));
    }
  }

  void clear() => Get.find<LocaleDb>().clearAll();
}

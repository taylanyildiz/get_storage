import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage_exam/models/user.dart';

class LocaleDb extends GetxController {
  final box = GetStorage();
  late List<User> userInfo;

  @override
  void onInit() {
    super.onInit();
    getAllInfo();
  }

  getAllInfo() {
    List boxList = box.read('userInfo') ?? [];
    userInfo = boxList.map((e) => User.fromJson(e)).toList();
    update();
  }

  addInfo(User user) async {
    int index = userInfo.indexWhere((element) => element == user);
    if (index == -1) {
      userInfo.add(user);
      List boxList = userInfo.map((e) => e.toJson()).toList();
      await box.write('userInfo', boxList);
    }

    update();
  }

  clearAll() {
    box.remove('userInfo');
    userInfo.clear();
    update();
  }
}

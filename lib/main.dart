import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage_exam/controllers/home_screen_controller.dart';
import 'package:get_storage_exam/services/locale_db.dart';

void main() async {
  await GetStorage.init();
  Get.put(LocaleDb());
  Get.put(HomeScreenController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('GetStorage Exam'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: GetBuilder(
          builder: (LocaleDb dbController) => Column(
            children: [
              Container(
                width: Get.width,
                height: 100.0,
                margin: EdgeInsets.only(top: 100.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  itemCount: dbController.userInfo.length,
                  itemBuilder: (context, index) => Text(
                    dbController.userInfo[index].name! +
                        '\n' +
                        dbController.userInfo[index].lastName! +
                        '\n' +
                        dbController.userInfo[index].age.toString(),
                  ),
                ),
              ),
              _buildInputText(),
              SizedBox(height: 10.0),
              InkWell(
                onTap: () => controller.addUser(),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.orange,
                        size: 30.0,
                      ),
                      Spacer(),
                      Text(
                        'Add User',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              InkWell(
                onTap: () => controller.clear(),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.orange,
                        size: 30.0,
                      ),
                      Spacer(),
                      Text(
                        'Clear All',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildInputText() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextFormField(
              validator: (input) => input!.isEmpty ? 'Cannot be empty' : null,
              controller: controller.nameController,
              decoration: InputDecoration(
                hintText: 'name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextFormField(
              validator: (input) => input!.isEmpty ? 'Cannot be empty' : null,
              controller: controller.lastnameController,
              decoration: InputDecoration(
                hintText: 'last name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextFormField(
              validator: (input) => input!.isEmpty ? 'Cannot be empty' : null,
              controller: controller.ageController,
              decoration: InputDecoration(
                hintText: 'age',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

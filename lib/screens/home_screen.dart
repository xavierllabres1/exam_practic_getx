import 'package:exam_practic_getx/controllers/controllers.dart';
import 'package:exam_practic_getx/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Recuperar el provider
    UserController userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Usuaris API GETX"),
        actions: [
          GestureDetector(
            child: Icon(Icons.navigate_before),
            onTap: () {
              int pagina = userController.userResponse!.page!;
              int totalPag = userController.userResponse!.totalPages!;
              if (pagina != null && (pagina > 1)) {
                userController.page = userController.page - 1;
                userController.getData();
              }
            },
          ),
          GestureDetector(
            child: Icon(Icons.navigate_next),
            onTap: () {
              int pagina = userController.userResponse!.page!;
              int totalPag = userController.userResponse!.totalPages!;
              if (pagina != null && (pagina < totalPag)) {
                userController.page = userController.page + 1;
                userController.getData();
              }
            },
          ),
        ],
      ),
      body: Obx(
        () => userController.isDataLoading.value
            ? const Center(child: CircularProgressIndicator())
            : LlistaUsuaris(
                llistaUsuaris: userController.userResponse!.data as List<User>),
      ),
    );
  }

  // Contingut del cos
  LlistaUsuaris({required List<User> llistaUsuaris}) {
    return ListView.builder(
      itemCount: llistaUsuaris.length,
      itemBuilder: (BuildContext context, int index) {
        final usAvatar;

        if (llistaUsuaris[index].avatar != null) {
          usAvatar = llistaUsuaris[index].avatar;
        } else {
          usAvatar =
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
        }
        return Column(
          children: [
            Card(
              elevation: 2.0,
              margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: ListTile(
                // Obrim la segona pàgina
                onTap: () => Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: llistaUsuaris[index],
                ),
                title: Text(llistaUsuaris[index].firstName +
                    " " +
                    llistaUsuaris[index].lastName),
                subtitle: Text(llistaUsuaris[index].email),
                leading: Image(
                  image: NetworkImage(usAvatar),
                ),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ],
        );
      },
    );
  }
}

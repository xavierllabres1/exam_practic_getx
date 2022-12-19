import 'package:flutter/material.dart';
import '../models/models.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User usuari = ModalRoute.of(context)?.settings.arguments as User;
    final usAvatar;

    if (usuari.avatar != null) {
      usAvatar = usuari.avatar;
    } else {
      usAvatar =
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(usuari.firstName + " " + usuari.lastName),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0),
          Card(
            child: Image(
              image: NetworkImage(usAvatar),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(usuari.firstName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text(usuari.lastName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(usuari.email),
          ),
        ],
      ),
    );
  }
}

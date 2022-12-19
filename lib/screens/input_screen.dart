import 'package:exam_practic_getx/controllers/controllers.dart';
import 'package:exam_practic_getx/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputScreen extends StatelessWidget {
  // Controllers
  final _nomController = TextEditingController(text: "");
  final _llinatgeController = TextEditingController(text: "");
  final _correuController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    // Recuperar de GETX
    UserController userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Introduir Usuari"), //S'agafa el llinatge del User
      ),
      body: ListView(
        //Es mostra una llista d'elements al body, que s'implementen per separat
        /* Llista d'elements al body */
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        children: [
          TextField(
            controller: _nomController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Nom',
              icon: Icon(Icons.account_circle),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          Divider(),
          TextField(
            controller: _llinatgeController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Llinatge',
              icon: Icon(Icons.account_circle_outlined),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          Divider(),
          TextField(
            controller: _correuController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Correu Electrònic',
              icon: Icon(Icons.email),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Validar que sigui correcte
          if (_nomController.text.isEmpty) {
            //Alerta de nom buid
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('No pots deixar el camp del nom en blanc'),
                  actions: <Widget>[
                    FloatingActionButton(
                      child: Icon(Icons.check),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            if (!validateEmail(_correuController.text)) {
              // Alerta de mail
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Has d\'introduir un correu electrònic vàlid'),
                    actions: <Widget>[
                      FloatingActionButton(
                        child: Icon(Icons.check),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              //Es permet el guardar una persona sense llinatges ni sense contrasenya
              //Emplenar l'objecte perRet per retornar a la pantalla inicial.
              final User userRet = User(
                  email: _correuController.text,
                  firstName: _nomController.text,
                  lastName: _llinatgeController.text);

              // AGREGAR A LA LLISTA del OBJECTE USER RESPONSE
              // SERA TEMPORAL, FINS QUE REFRESQUI LA PAGINA
              userController.userResponse!.data!.add(userRet);

              // Tornar Enrere
              Navigator.of(context).pop();
            }
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }

  //Metode per comprovar que es un email
  bool validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return false;
    else
      return true;
  }
}

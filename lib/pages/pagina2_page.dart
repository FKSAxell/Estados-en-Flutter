import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cargarUsuario(Usuario(nombre: 'Axell', edad: 24));
                Get.snackbar(
                  'Usuario Cargado',
                  'Se cargó correctamente',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(color: Colors.black38, blurRadius: 10)
                  ],
                );
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(25);
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.agregarProfesion(
                    'Profesión #${usuarioCtrl.profesionesCount + 1}');
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar Theme',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

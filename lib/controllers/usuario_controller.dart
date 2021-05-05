import 'package:estados/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  Rx<Usuario> usuario = new Usuario().obs;

  int get profesionesCount {
    return this.usuario.value.profesiones.length;
  }

  void cargarUsuario(Usuario pUsuario) {
    this.existeUsuario.value = true;
    this.usuario.value = pUsuario;
  }

  void cambiarEdad(int pEdad) {
    this.usuario.update((val) {
      val!.edad = pEdad;
    });
  }

  void agregarProfesion(String profesion) {
    this.usuario.update((val) {
      val!.profesiones = [...val.profesiones, profesion];
    });
  }
}

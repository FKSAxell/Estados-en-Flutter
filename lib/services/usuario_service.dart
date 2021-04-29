import 'dart:async';

import 'package:estados/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario;
  StreamController<Usuario> _usuarioStreamController =
      new StreamController<Usuario>.broadcast();

  Stream<Usuario> get usuarioStream => this._usuarioStreamController.stream;

  Usuario get usuario => this._usuario;
  bool get existeUsuario => (this._usuario != null) ? true : false;

  void cargarUsuario(Usuario user) {
    this._usuario = user;
    this._usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    this._usuarioStreamController.add(this._usuario);
  }

  dispose() {
    this._usuarioStreamController?.close();
  }
}

final usuarioService = _UsuarioService();

import 'package:estados/models/usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(new UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: 30);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      // List<String> profesionesC = currentState.usuario.profesiones;
      // profesionesC.add("1");
      List<String> profesiones = [
        ...currentState.usuario.profesiones,
        'Profesion ${currentState.usuario.profesiones.length + 1}'
      ];
      final newUser = currentState.usuario.copyWith(profesiones: profesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}

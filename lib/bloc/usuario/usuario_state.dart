part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {
  final existeUsuario = false;
  // @override
  // String toString() {
  //   return 'UsuarioInitial: existeUsuario: false';
  // }
}

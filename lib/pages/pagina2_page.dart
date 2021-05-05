import 'package:estados/bloc/usuario/usuario_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioBloc = context.read<UsuarioBloc>();

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
                final newUser = new Usuario(
                    nombre: 'Axell',
                    edad: 24,
                    profesiones: ['Fullstack Developer']);
                usuarioBloc.add(ActivarUsuario(newUser));
                // BlocProvider.of<UsuarioBloc>(context)
                //     .add(ActivarUsuario(newUser));
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                // BlocProvider.of<UsuarioBloc>(context).add(CambiarEdad(30));
                usuarioBloc.add(CambiarEdad(30));
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioBloc.add(AgregarProfesion('Nueva Profesion'));
              },
            ),
          ],
        ),
      ),
    );
  }
}

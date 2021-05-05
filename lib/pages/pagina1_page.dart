import 'package:estados/bloc/usuario/usuario_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioBloc = context.watch<UsuarioBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              usuarioBloc.add(BorrarUsuario());
            },
          ),
        ],
      ),
      body: (usuarioBloc.state.existeUsuario)
          ? InformacionUsuario(usuarioBloc.state.usuario)
          : Center(child: Text('No hay una cuenta seleccionada')),
      //     BlocBuilder<UsuarioBloc, UsuarioState>(
      //   builder: (_, state) {
      //     if (state.existeUsuario) {
      //       return InformacionUsuario(state.usuario);
      //     } else {
      //       return Center(
      //         child: Text('No hay una cuenta seleccionada'),
      //       );
      //     }
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad:${usuario.edad}'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
        ],
      ),
    );
  }
}

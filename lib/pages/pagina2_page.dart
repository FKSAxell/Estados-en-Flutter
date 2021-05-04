import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
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
                //llamar al cubit
                /*
                final bloc = BlocProvider.of<UsuarioCubit>(context, listen:false);
                final newUser = new Usuario(nombre: 'David',edad: 24,
                                  profesiones: ['FullStack Developer','Machine learning'],);
                bloc.seleccionarUsuario(newUser);
                ------
                context.read es el simil de BlocProvider.of<UsuarioCubit>(context, listen:false);
 
                context.read<UsuarioCubit>();
                
                context.watch se queda escuchando los cambios de estados si usas el segundo podrias omitir el 
                BlocBuilder pero hay que tener ojo si lo llamas dentro de un metodo hay debes usar context.read
                
                BlocProvider.of<UsuarioCubit>(context);
                context.watch<UsuarioCubit>();
                */
                final newUser = new Usuario(
                  nombre: 'Axell',
                  edad: 24,
                  profesiones: ['FullStack Developer', 'Machine learning'],
                );
                usuarioCubit.seleccionarUsuario(newUser);
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdad(30);
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}

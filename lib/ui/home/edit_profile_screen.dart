import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/ui/home/cubit/home_cubit.dart';
import 'package:my_shop/utils/constants.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    String image = 'https://images.materilejuguetes.com/imagenes/productos/5@img5cad51fd69d85.jpg';
    return BlocConsumer<HomeCubit, HomeState>(
      listener: ((context, state) {
        // image = state.;
      }),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xffE1F5FF),
          appBar: AppBar(
            elevation: 0,
            foregroundColor: kSecondaryColor,
            backgroundColor: const Color(0xffE1F5FF),
            title: const Text(
              "Editar perfil",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: MediaQuery.of(context).size.width / 5
                  ),
                  const Spacer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: state.urlController,
                            initialValue: state.user!.urlProfile ?? '',
                            decoration: const InputDecoration(
                                labelText: 'Url Imagen de perfil',
                                hintText: 'Url Imagen de perfil')),
                        TextFormField(
                          controller: state.firstNameController,
                            initialValue: state.user!.firstName,
                            decoration: const InputDecoration(
                                hintText: 'Nombre', labelText: 'Nombre')),
                        TextFormField(
                          controller: state.lastNameController,
                            initialValue: state.user!.lastName,
                            decoration: const InputDecoration(
                                labelText: 'Apellido', hintText: 'Apellido')),
                        TextFormField(
                          controller: state.emailController,
                            initialValue: state.user!.email,
                            decoration: const InputDecoration(
                                labelText: 'Correo', hintText: 'Correo')),
                        SizedBox(
                            width: 80,
                            child: TextFormField(
                              controller: state.ageController,
                                initialValue: '${state.user!.age}',
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    labelText: 'Edad', hintText: 'Edad'))),
                      ],
                    )),
                  ),
                  const Spacer(flex: 3),
                  MaterialButton(
                    height: 40,
                    minWidth: double.infinity,
                    color: kPrimaryColor,
                    onPressed: () {},
                    child: const Text(
                      'Crear Producto',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_shop/utils/constants.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE1F5FF),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: kSecondaryColor,
        backgroundColor: const Color(0xffE1F5FF),
        // ignore: prefer_const_constructors
        title: Text(
          "Editar perfil",
          textAlign: TextAlign.center,
          style: const TextStyle(
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
              CircleAvatar(radius: MediaQuery.of(context).size.width / 5),
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Url Imagen de perfil')),
                    TextFormField(
                        decoration: const InputDecoration(hintText: 'Nombre')),
                    TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Apellido')),
                    // Row(
                    //   children: [
                    //     Flexible(
                    //         child: ),
                    //     const SizedBox(width: 20),
                    //     Flexible(
                    //       child:
                    //     ),
                    //   ],
                    // ),
                    TextFormField(
                        decoration: const InputDecoration(hintText: 'Correo')),
                    SizedBox(
                        width: 80,
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(hintText: 'Edad'))),
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
  }
}

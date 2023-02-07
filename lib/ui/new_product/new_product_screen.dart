import 'package:flutter/material.dart';
import 'package:my_shop/utils/constants.dart';

class NewProductScreen extends StatelessWidget {
  const NewProductScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE1F5FF),
      appBar: AppBar(
        elevation: 0,
        foregroundColor: kSecondaryColor,
        backgroundColor: const Color(0xffE1F5FF),
        title: Text(
          title,
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
                height: MediaQuery.of(context).size.height / 2.1,
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(hintText: 'Nombre')),
                    TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Descripción')),
                    Row(
                      children: [
                        Flexible(
                            child: TextFormField(
                                decoration:
                                    const InputDecoration(hintText: 'Precio'))),
                        const SizedBox(width: 20),
                        Flexible(
                            child: TextFormField(
                                decoration:
                                    const InputDecoration(hintText: 'Marca'))),
                      ],
                    ),
                    TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Categoría')),
                    TextFormField(
                        decoration: const InputDecoration(hintText: 'Estado')),
                  ],
                )),
              ),
              const Spacer(flex: 2),
              MaterialButton(
                height: 40,
                minWidth: double.infinity,
                color: kPrimaryColor,
                onPressed: () {},
                child: Text(
                  'Crear Producto',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

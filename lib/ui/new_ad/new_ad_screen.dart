import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/ui/admin/cubit/admin_cubit.dart';
import 'package:my_shop/ui/home/cubit/home_cubit.dart';
import 'package:my_shop/ui/new_ad/cubit/new_ad_cubit.dart';
import 'package:my_shop/utils/constants.dart';

class NewAdScreen extends StatelessWidget {
  const NewAdScreen({super.key});

  final String title = "Crear Anuncio XD";

  @override
  Widget build(BuildContext context) {
    String image = 'https://images.materilejuguetes.com/imagenes/productos/5@img5cad51fd69d85.jpg';
    return BlocBuilder<NewAdCubit, NewAdState>(
      builder: (context, state) {
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
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        BlocConsumer<NewAdCubit, NewAdState>(
                          listener: (context, state) {
                            image = state.profileController.text.isEmpty
                              ? 'https://images.materilejuguetes.com/imagenes/productos/5@img5cad51fd69d85.jpg'
                              : state.profileController.text;
                          },
                          builder: (context, state) {
                            return CircleAvatar(
                                backgroundImage: NetworkImage(image),
                                radius: MediaQuery.of(context).size.width / 5);
                          },
                        ),
                        const Spacer(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2.1,
                          child: Form(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextFormField(
                                  controller: state.profileController,
                                  onChanged: (value) {
                                    context
                                        .read<NewAdCubit>()
                                        .setStatus(state.status);
                                  },
                                  decoration: const InputDecoration(
                                      hintText: 'Url Image')),
                              TextFormField(
                                  controller: state.nameController,
                                  decoration: const InputDecoration(
                                      hintText: 'Nombre')),
                              TextFormField(
                                  controller: state.descriptionController,
                                  decoration: const InputDecoration(
                                      hintText: 'Descripción')),
                              Row(
                                children: [
                                  Flexible(
                                      child: TextFormField(
                                          controller: state.discountController,
                                          decoration: const InputDecoration(
                                              hintText: 'Descuento'))),
                                  const SizedBox(width: 20),
                                  Flexible(
                                      child: TextFormField(
                                          controller: state.brandController,
                                          decoration: const InputDecoration(
                                              hintText: 'Marca'))),
                                ],
                              ),
                              TextFormField(
                                  controller: state.categoryController,
                                  decoration: const InputDecoration(
                                      hintText: 'Categoría')),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                      value: state.status,
                                      onChanged: (value) {
                                        if (value != null) {
                                          context
                                              .read<NewAdCubit>()
                                              .setStatus(value);
                                        }
                                      }),
                                  Text(state.status ? 'Activo' : 'Innactivo')
                                ],
                              )
                            ],
                          )),
                        ),
                        const Spacer(flex: 2),
                        MaterialButton(
                          height: 40,
                          minWidth: double.infinity,
                          color: kPrimaryColor,
                          onPressed: () async {
                            bool isValid = context
                                .read<NewAdCubit>()
                                .validationForm();
                            if (isValid) {
                              bool isCreated = await context.read<NewAdCubit>().createAd();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  String title   = isCreated ? 'Realizado':'Error';
                                  String content = isCreated ? 'Producto creado exitosamente':'Error al crear productor';
                                  return CupertinoAlertDialog(
                                    title: Text(title),
                                    content: Text(content),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: const Text('Aceptar'),
                                        onPressed: () {
                                          context.read<AdminCubit>().getMainProducts();
                                          context.read<AdminCubit>().getMainAds();
                                          context.read<HomeCubit>().getHome();
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                }
                              );
                            }
                          },
                          child: const Text(
                            'Crear Producto',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

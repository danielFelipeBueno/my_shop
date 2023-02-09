import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/domain/models/products_model.dart';
import 'package:my_shop/ui/product/product_screen.dart';
import 'package:my_shop/ui/search/cubit/search_cubit.dart';
import 'package:my_shop/utils/constants.dart';

class SearchModule extends StatelessWidget {
  const SearchModule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            showSearch(
                context: context,
                delegate: CustomSearchDelegate(state.products));
          },
          child: Container(
            margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              color: Colors.white,
              boxShadow: boxShadowCard
            ),
            child: Row(
              children: const [
                Icon(Icons.search),
                SizedBox(width: 10),
                Text('Buscar')
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<Product> {
  final List<Product> products;

  CustomSearchDelegate(this.products);
  var voidProduct = Product(
      name: '',
      description: '',
      brand: '',
      category: '',
      image: '',
      userId: '',
      price: 0,
      status: false);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, voidProduct);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            var product = state.products[index];
            return ListTile(
              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ProductScreen(product: product, isAdmin: false,))),
              title: Text(product.name),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<SearchCubit>().search(query);
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            var product = state.products[index];
            return ListTile(
              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ProductScreen(product: product, isAdmin: false,))),
              title: Text(product.name),
            );
          },
        );
      },
    );
  }
}

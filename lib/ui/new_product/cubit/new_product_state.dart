part of 'new_product_cubit.dart';

class NewProductState {
  final TextEditingController profileController;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController brandController;
  final TextEditingController categoryController;
  final bool status;

  NewProductState(
      this.profileController,
      this.nameController,
      this.descriptionController,
      this.priceController,
      this.brandController,
      this.categoryController,
      {this.status = true});

  NewProductState copyWith(
      {TextEditingController? profileController,
      TextEditingController? nameController,
      TextEditingController? descriptionController,
      TextEditingController? priceController,
      TextEditingController? brandController,
      TextEditingController? categoryController,
      bool? status}) {
    return NewProductState(
        profileController ?? this.profileController,
        nameController ?? this.nameController,
        descriptionController ?? this.descriptionController,
        priceController ?? this.priceController,
        brandController ?? this.brandController,
        categoryController ?? this.categoryController,
        status: status ?? this.status);
  }
}

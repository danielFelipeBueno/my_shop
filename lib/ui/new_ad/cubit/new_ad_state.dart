
part of 'new_ad_cubit.dart';


class NewAdState {
  final TextEditingController profileController;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController discountController;
  final TextEditingController brandController;
  final TextEditingController categoryController;
  final bool status;

  NewAdState(
      this.profileController,
      this.nameController,
      this.descriptionController,
      this.discountController,
      this.brandController,
      this.categoryController,
      {this.status = true});

  NewAdState copyWith(
      {TextEditingController? profileController,
      TextEditingController? nameController,
      TextEditingController? descriptionController,
      TextEditingController? discountController,
      TextEditingController? brandController,
      TextEditingController? categoryController,
      bool? status}) {
    return NewAdState(
        profileController ?? this.profileController,
        nameController ?? this.nameController,
        descriptionController ?? this.descriptionController,
        discountController ?? this.discountController,
        brandController ?? this.brandController,
        categoryController ?? this.categoryController,
        status: status ?? this.status);
  }
}

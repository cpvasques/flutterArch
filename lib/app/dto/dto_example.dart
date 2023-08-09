import '../models/model_example.dart';

class ExampleDto {
  final ModelExample product;
  final int amount;

  ExampleDto({
    required this.product,
    required this.amount,
  });

  double get totalPrice => amount * product.value;
}

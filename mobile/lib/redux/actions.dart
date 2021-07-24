import 'package:cash_manager/models/Cart.dart';

class AddItemAction {
  final Cart item;

  AddItemAction(this.item);
}

class DeleteItemAction {
  final Cart item;

  DeleteItemAction(this.item);
}
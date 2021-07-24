import 'package:cash_manager/redux/actions.dart';
import 'package:cash_manager/models/Cart.dart';

List<Cart> cartItemsReducer(List<Cart> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  } else if (action is DeleteItemAction) {
    return deleteItem(items, action);
  }
  return items;
}

List<Cart> addItem(List<Cart> items, AddItemAction action) {
  return new List.from(items)..add(action.item);
}

List<Cart> deleteItem(List<Cart> items, DeleteItemAction action) {
  return new List.from(items)..remove(action.item);
}
import 'package:adventure_ui_demo/model/item_model.dart';
import 'package:flutter/cupertino.dart';

class BookmarkBlock extends ChangeNotifier {
  List<ItemModel> bookmarkItem = [];

  void addItem(ItemModel data) {
    bookmarkItem.add(data);
    notifyListeners();
  }

  void removeItem(ItemModel data) {
    bookmarkItem.remove(data);
    notifyListeners();
  }

  List<ItemModel> get itemList {
    return bookmarkItem;
  }
}

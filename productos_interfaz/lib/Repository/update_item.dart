import 'package:productos_interfaz/Data/item_data.dart';

abstract class IUUpdateItemrepository {
  void onUpdateItem(ItemData itemData);
  void onError(String error);
}

class IUpdateRepository {
  late IUUpdateItemrepository iuUpdateItemrepository;
  IUpdateRepository(this.iuUpdateItemrepository);

  void upDateItem() {}
}

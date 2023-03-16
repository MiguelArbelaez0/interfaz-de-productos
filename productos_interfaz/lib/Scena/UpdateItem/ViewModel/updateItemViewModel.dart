import 'package:productos_interfaz/Data/item_data.dart';
import 'package:productos_interfaz/Repository/update_item.dart';

abstract class IUpdateViewModel {
  void onUpdateComplete(ItemData itemData);
  void onError(String error);
}

class IupdateViewModel implements IUUpdateItemrepository {
  late IUpdateRepository iUpdateRepository;
  late IUpdateViewModel iUpdateViewModel;
  IupdateViewModel(this.iUpdateViewModel) {
    iUpdateRepository = IUpdateRepository(this);
  }
  void upDateItem() {
    iUpdateRepository.upDateItem();
  }

  @override
  void onError(String error) {
    // TODO: implement onError
    iUpdateViewModel.onError(error);
  }

  @override
  void onUpdateItem(ItemData itemData) {
    // TODO: implement onUpdateItem
    iUpdateViewModel.onUpdateComplete(itemData);
  }
}

import 'package:productos_interfaz/Data/GetItemDelete.dart';

import '../../../Data/GetListItems.dart';
import '../../../Repository/GetListRepository.dart';

abstract class IIGetListViewModel {
  void onGetItem(GetListItems getListItems);
  void onError(String error);
  void onDeleteItem(GetItemDelete getItemDelete);
}

class IGetViewModel implements IUGetListrepository {
  late IGetListRepository iGetListRepository;
  late IIGetListViewModel iiGetListViewModel;
  IGetViewModel(this.iiGetListViewModel) {
    iGetListRepository = IGetListRepository(this);
  }

  void getListItem() {
    iGetListRepository.getlistItem();
  }

  void getItemDelete() {
    iGetListRepository.deleteItems();
  }

  @override
  void onError(String error) {
    // TODO: implement onError
    iiGetListViewModel.onError(error);
  }

  @override
  void onGetItem(GetListItems getListItems) {
    // TODO: implement onGetItem}
    iiGetListViewModel.onGetItem(getListItems);
  }

  @override
  void onDeleteItem(GetItemDelete getItemDelete) {
    // TODO: implement onDeleteItem
    iiGetListViewModel.onDeleteItem(getItemDelete);
  }
}

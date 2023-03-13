import '../../../Data/GetItem.dart';
import '../../../Data/GetListItems.dart';
import '../../../Repository/GetListRepository.dart';

abstract class IIGetListViewModel {
  void onGetItem(GetListItems getListItems);
  void onError(String error);
  void onDeleteItem();
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

  void getItemDelete(String id) {
    iGetListRepository.deleteItems(id);
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
  void onDeleteItem() {
    // TODO: implement onDeleteItem
    iiGetListViewModel.onDeleteItem();
  }
}
